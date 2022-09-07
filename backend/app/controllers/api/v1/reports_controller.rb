class Api::V1::ReportsController < ApplicationController
  def show
    report = Report.find(params[:id])
    render json: report, include: [:report_hosts], status: 200
  end
end
