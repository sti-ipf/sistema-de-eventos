require 'spec_helper'

describe "directors/edit.html.haml" do
  before(:each) do
    @director = assign(:director, stub_model(Director,
      :unit_type => "MyString",
      :employee_id => "MyString",
      :unit => "MyString",
      :address => "MyString",
      :district => "MyString",
      :email => "MyString",
      :director => "MyString"
    ))
  end

  it "renders the edit director form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => directors_path(@director), :method => "post" do
      assert_select "input#director_unit_type", :name => "director[unit_type]"
      assert_select "input#director_employee_id", :name => "director[employee_id]"
      assert_select "input#director_unit", :name => "director[unit]"
      assert_select "input#director_address", :name => "director[address]"
      assert_select "input#director_district", :name => "director[district]"
      assert_select "input#director_email", :name => "director[email]"
      assert_select "input#director_director", :name => "director[director]"
    end
  end
end
