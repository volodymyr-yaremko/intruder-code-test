class Api::V1::ReportHostsController < ApplicationController
  before_action :set_report, only: [:show]

  def show
    host = @report.report_hosts.find(params[:id])
    render json: host, include: [report_items: {include: [plugin: {include: [:plugin_family]}]}]
  end

  private
    def set_report
      @report = Report.find(params[:report_id])
    end
end
