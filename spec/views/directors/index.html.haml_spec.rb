require 'spec_helper'

describe "directors/index.html.haml" do
  before(:each) do
    assign(:directors, [
      stub_model(Director,
        :unit_type => "Unit Type",
        :employee_id => "Employee",
        :unit => "Unit",
        :address => "Address",
        :district => "District",
        :email => "Email",
        :director => "Director"
      ),
      stub_model(Director,
        :unit_type => "Unit Type",
        :employee_id => "Employee",
        :unit => "Unit",
        :address => "Address",
        :district => "District",
        :email => "Email",
        :director => "Director"
      )
    ])
  end

  it "renders a list of directors" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Unit Type".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Employee".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Unit".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "District".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Director".to_s, :count => 2
  end
end
