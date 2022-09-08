class Api::V1::ReportHostsController < ApplicationController
  before_action :set_report, :set_host, only: [:show, :items]

  def show
    render json: @host
  end

  def items
    render json: @host.report_items.page(params[:page]), include: [plugin: {include: [:plugin_family]}]
  end

  private
    def set_report
      @report = Report.find(params[:report_id])
    end

    def set_host
      @host = @report.report_hosts.find(params[:id])
    end
end
