require 'spec_helper'

describe "registrations/new.html.haml" do
  before(:each) do
    assign(:registration, stub_model(Registration,
      :name => "MyString",
      :credential_name => "MyString",
      :rg => "MyString",
      :zip_code => "MyString",
      :address => "MyString",
      :address_number => "MyString",
      :address_complement => "MyString",
      :district => "MyString",
      :city => "MyString",
      :state => "MyString",
      :country => "MyString",
      :phone => "MyString",
      :mobile => "MyString",
      :email => "MyString",
      :how_known => 1,
      :unit => "MyString",
      :unit_zip_code => "MyString",
      :unit_address => "MyString",
      :unit_address_complement => "MyString",
      :unit_district => "MyString",
      : => "",
      : => "",
      : => "",
      : => "",
      :disabilities => false,
      :send_any_work => false,
      :student => false,
      :status => 1,
      :mode_of_payment => 1
    ).as_new_record)
  end

  it "renders new registration form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => registrations_path, :method => "post" do
      assert_select "input#registration_name", :name => "registration[name]"
      assert_select "input#registration_credential_name", :name => "registration[credential_name]"
      assert_select "input#registration_rg", :name => "registration[rg]"
      assert_select "input#registration_zip_code", :name => "registration[zip_code]"
      assert_select "input#registration_address", :name => "registration[address]"
      assert_select "input#registration_address_number", :name => "registration[address_number]"
      assert_select "input#registration_address_complement", :name => "registration[address_complement]"
      assert_select "input#registration_district", :name => "registration[district]"
      assert_select "input#registration_city", :name => "registration[city]"
      assert_select "input#registration_state", :name => "registration[state]"
      assert_select "input#registration_country", :name => "registration[country]"
      assert_select "input#registration_phone", :name => "registration[phone]"
      assert_select "input#registration_mobile", :name => "registration[mobile]"
      assert_select "input#registration_email", :name => "registration[email]"
      assert_select "input#registration_how_known", :name => "registration[how_known]"
      assert_select "input#registration_unit", :name => "registration[unit]"
      assert_select "input#registration_unit_zip_code", :name => "registration[unit_zip_code]"
      assert_select "input#registration_unit_address", :name => "registration[unit_address]"
      assert_select "input#registration_unit_address_complement", :name => "registration[unit_address_complement]"
      assert_select "input#registration_unit_district", :name => "registration[unit_district]"
      assert_select "input#registration_", :name => "registration[]"
      assert_select "input#registration_", :name => "registration[]"
      assert_select "input#registration_", :name => "registration[]"
      assert_select "input#registration_", :name => "registration[]"
      assert_select "input#registration_disabilities", :name => "registration[disabilities]"
      assert_select "input#registration_send_any_work", :name => "registration[send_any_work]"
      assert_select "input#registration_student", :name => "registration[student]"
      assert_select "input#registration_status", :name => "registration[status]"
      assert_select "input#registration_mode_of_payment", :name => "registration[mode_of_payment]"
    end
  end
end
