require 'spec_helper'

describe "directors/show.html.haml" do
  before(:each) do
    @director = assign(:director, stub_model(Director,
      :unit_type => "Unit Type",
      :employee_id => "Employee",
      :unit => "Unit",
      :address => "Address",
      :district => "District",
      :email => "Email",
      :director => "Director"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Unit Type/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Employee/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Unit/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Address/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/District/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Email/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Director/)
  end
end
