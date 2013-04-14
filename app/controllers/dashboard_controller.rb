class DashboardController < ApplicationController

  def index
    redirect_to index_path unless user_signed_in?
    if current_user
      get_projects
      # @projects = current_user.projects.all

      get_sites
      # @sites = current_user.sites.all

      pending_reports
      # @reports = Report.where(:status => "needs_attention")

      get_ie
      # @inspection_events = []
    end
  end

  def get_projects
    @projects = []
    projects = current_user.projects.all

    if projects.blank?
      'No active projects'
    else
      projects.each do |p|
        @projects << p
      end
    end

    return @projects
=begin
    unless @projects.blank?
      return @projects
    else
      'No active projects, start one by clicking \'new project\'.'
    end
=end
  end

  def get_sites
    get_projects
    @sites = []
    @projects.each do |p|
      p.sites.each do |s|
        @sites << s
      end
    end

    return @sites
  end

  def get_ie
    get_sites
    @pending_ie = []
    @sites.each do |s|
      s.inspection_events.each do |ie|
        if ie.completed == false
          @pending_ie << ie
        end
      end
    end

    return @pending_ie
=begin
    unless @pending_ie.blank?
      return @pending_ie
    else
      'No pending inspections'
    end
=end
  end

  def get_reports
    get_sites
    @all_reports = []
    @sites.each do |s|
      s.reports.each do |r|
        @all_reports << r
      end
    end

    return @all_reports
  end

  def pending_reports
    get_reports
    @pending_reports = []

    @all_reports.each do |r|
      if r.status == 'needs_attention'
        @pending_reports << r
      end
    end

    unless @pending_reports.blank?
      return @pending_reports
    else
      'No pending reports.'
    end
  end
end
