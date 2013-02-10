require 'spec_helper'

describe "reports/_show_pdf" do

  before(:each) do
    assign(:reports, [
      stub_model(Report),
      stub_model(Report)
    ])
    @report = FactoryGirl.create(:report, :id => 1)
  end
  
  it "renders show_pdf partial correctly" do    
    render
    rendered.should_not be_nil
  end
end
