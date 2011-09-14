require 'spec_helper'

describe "registrations/show.html.haml" do
  before(:each) do
    @registration = assign(:registration, stub_model(Registration,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Credential Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Rg/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Zip Code/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Address/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Address Number/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Address Complement/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/District/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/City/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/State/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Country/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Phone/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Mobile/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Email/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Unit/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Unit Zip Code/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Unit Address/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Unit Address Complement/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Unit District/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
