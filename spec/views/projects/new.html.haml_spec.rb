require 'spec_helper'

describe "projects/new" do
  before(:each) do
    assign(:project, stub_model(Project,
      :user_id => 1,
      :name => "MyString",
      :description => "MyText",
      :active => false
    ).as_new_record)
  end

  it "renders new project form" do
    render
    assert_select "form", :action => projects_path, :method => "post" do
      assert_select "input#project_name", :name => "project[name]"
      assert_select "textarea#project_description", :name => "project[description]"
      assert_select "input#project_active", :name => "project[active]"
    end
  end
end
