class ReportsController < ApplicationController
  require 'prawn'

  STATIC_REPORTS = %w[CEM2035 CEM2057 CEM2052]

  def index
    @reports = Report.all
  end

  def show
    @report = Report.find(params[:id])
  end

  def new
    @report = Report.new
  end

  def create
    @report = Report.new(params[:report])
  end

  def CEM2035
    pdf = Prawn::Document.new
    pdf.text "CEM2035"
    send_data pdf.render, type: "application/pdf", disposition: "inline"
  end

  def CEM2057
    pdf = Prawn::Document.new
    @test = "test"
    pdf.text @test
    send_data pdf.render, type: "application/pdf", disposition: "inline"
  end

  def CEM2052
    pdf = Prawn::Document.new
    pdf.text "CEM2057"
    send_data pdf.render, type: "application/pdf", disposition: "inline"
  end

end
