require 'spec_helper'
require 'project_local_time'

describe ProjectLocalTime do
  before :each do
    time = Time.new(2013, 01, 13, 18, 0, 0)
    @local_time = ProjectLocalTime::format(time)
  end

  it "formats date and time for email" do
    datetime = "Sunday, 13 January 2013 18:00 PST"
    time = Time.new(2013, 01, 13, 18, 0, 0)
    ProjectLocalTime::format(time).should == datetime
    @local_time.should == datetime
  end
end
