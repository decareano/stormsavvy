class SamplingEventWorkflow < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :site

  # Send message to dashboard when sampling_imminent? == true
  # CEM2051, CEM 2052
  # Does this have to be done before every rain
  # Check for project type, i.e., construction

  def initialize(site)
    @site = site
  end

  def sampling_imminent?
    if chance_of_rain > 50 && forecast_rain > 0.5 && hours_before_rain < 24
      start_sampling_event_workflow
    end       
  end

  def start_sampling_event_workflow
    check_sampling_event
    if sampling_event?
      "Sampling Event prepared"
      SamplingEvent.create
    end

    check_cem2051
    if cem2051?
      "CEM2051 prepared"
      Report.create(:type => 'CEM2051')
    end

    check_cem2052
    if cem2052?
      "CEM2052 prepared"
      Report.create(:type => 'CEM2052')
    end
  end

  def check_cem2051
    prepare_cem2051 unless self.cem2051?
  end

  def prepare_cem2051
    self.cem2051 = true #unless reap_borked?
    "CEM2051 prepared"
  end

  def check_cem2052
    prepare_cem2052 unless self.cem2052?
  end

  def prepare_cem2052
    self.cem2052 = true #unless reap_borked?
    "CEM2052 prepared"    
  end

  def check_sampling_event
    prepare_sampling_event unless self.sampling_event?
  end

  def prepare_sampling_event
    self.sampling_event = true #unless reap_borked?
    "Sampling Event prepared"    
  end
end
