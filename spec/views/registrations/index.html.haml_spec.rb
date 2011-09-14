require 'spec_helper'

describe "registrations/index.html.haml" do
  before(:each) do
    assign(:registrations, [
      stub_model(Registration,
        :name => "Name",
        :credential_name => "Credential Name",
        :rg => "Rg",
        :zip_code => "Zip Code",
        :address => "Address",
        :address_number => "Address Number",
        :address_complement => "Address Complement",
        :district => "District",
        :city => "City",
        :state => "State",
        :country => "Country",
        :phone => "Phone",
        :mobile => "Mobile",
        :email => "Email",
        :how_known => 1,
        :unit => "Unit",
        :unit_zip_code => "Unit Zip Code",
        :unit_address => "Unit Address",
        :unit_address_complement => "Unit Address Complement",
        :unit_district => "Unit District",
        : => "",
        : => "",
        : => "",
        : => "",
        :disabilities => false,
        :send_any_work => false,
        :student => false,
        :status => 1,
        :mode_of_payment => 1
      ),
      stub_model(Registration,
        :name => "Name",
        :credential_name => "Credential Name",
        :rg => "Rg",
        :zip_code => "Zip Code",
        :address => "Address",
        :address_number => "Address Number",
        :address_complement => "Address Complement",
        :district => "District",
        :city => "City",
        :state => "State",
        :country => "Country",
        :phone => "Phone",
        :mobile => "Mobile",
        :email => "Email",
        :how_known => 1,
        :unit => "Unit",
        :unit_zip_code => "Unit Zip Code",
        :unit_address => "Unit Address",
        :unit_address_complement => "Unit Address Complement",
        :unit_district => "Unit District",
        : => "",
        : => "",
        : => "",
        : => "",
        :disabilities => false,
        :send_any_work => false,
        :student => false,
        :status => 1,
        :mode_of_payment => 1
      )
    ])
  end

  it "renders a list of registrations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Credential Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Rg".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Zip Code".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Address Number".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Address Complement".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "District".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "City".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "State".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Country".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Mobile".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Unit".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Unit Zip Code".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Unit Address".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Unit Address Complement".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Unit District".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
