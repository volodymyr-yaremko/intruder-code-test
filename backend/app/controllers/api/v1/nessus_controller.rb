require 'nokogiri'

class Api::V1::NessusController < ApplicationController
    def upload
        if params[:file].present?
            doc = Nokogiri::XML.parse(params[:file])

            # extract <Report> node
            report_node = doc.css('Report').first

            # create a report on db
            report = Report.create(name: report_node.attr('name'))

            # extract all <ReportHost> node and iterate
            report_node.css('ReportHost').each do |host_node|
                # extract all host properties and keep inside hash
                host_props = {}
                host_node.css('HostProperties tag').each do |host_prop_node|
                    host_props[host_prop_node.attr('name')] = host_prop_node.text
                end

                # create a report_host on db
                report_host = report.report_hosts.create(name: host_node.attr('name'), props: host_props.to_json)

                # extract all <ReportItem> node and iterate
                host_node.css('ReportItem').each do |ri_node|
                    # extract all item properties and keep inside hash
                    ri_props = {}
                    ri_node.children.each do |ri_prop_node|
                        ri_props[ri_prop_node.name] = ri_prop_node.text
                    end

                    # find a plugin_family by name or create new one
                    plugin_family = PluginFamily.where(name: ri_node.attr('pluginFamily')).first_or_create
                    
                    # find a plugin by nessus_id and version or create new one
                    plugin = plugin_family.plugins.where(
                        nessus_id: ri_node.attr('pluginID'), 
                        version: ri_props['script_version']
                    ).first_or_create(
                        name: ri_node.attr('pluginName'),
                        check_type: Plugin.check_types[ri_props['plugin_type'].downcase],
                        modified_at: ri_props['plugin_modification_date'],
                        published_at: ri_props['plugin_publication_date'],
                    )

                    # create a report_item on db
                    report_host.report_items.create(
                        svc_name: ri_node.attr('svc_name'),
                        port: ri_node.attr('port'), 
                        protocol: ReportItem.protocols[ri_node.attr('protocol').downcase],
                        severity: ri_node.attr('severity').to_i,
                        risk_factor: ReportItem.risk_factors[ri_props['risk_factor'].downcase],
                        synopsis: ri_props['synopsis'],
                        description: ri_props['description'],
                        solution: ri_props['solution'],
                        output: ri_props['plugin_output'],
                        plugin: plugin
                    )
                end
            end

            return render json: report, status: 200
        end

        render json: 'Not able to find a report', status: 422
    end
end
