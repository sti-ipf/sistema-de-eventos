require 'spec_helper'

describe "employees/index.html.haml" do
  before(:each) do
    assign(:employees, [
      stub_model(Employee,
        :unit_type => "Unit Type",
        :headquarter => "Headquarter",
        :unit_type_lot => "Unit Type Lot",
        :unit_name => "Unit Name",
        :employee_id => 1,
        :employee_name => "Employee Name",
        :rg => "Rg",
        :cpf => "Cpf",
        :contract_type => "Contract Type",
        :role => "Role",
        :function => "Function",
        :workload => 1,
        :work_shift => "Work Shift",
        :eja => false
      ),
      stub_model(Employee,
        :unit_type => "Unit Type",
        :headquarter => "Headquarter",
        :unit_type_lot => "Unit Type Lot",
        :unit_name => "Unit Name",
        :employee_id => 1,
        :employee_name => "Employee Name",
        :rg => "Rg",
        :cpf => "Cpf",
        :contract_type => "Contract Type",
        :role => "Role",
        :function => "Function",
        :workload => 1,
        :work_shift => "Work Shift",
        :eja => false
      )
    ])
  end

  it "renders a list of employees" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Unit Type".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Headquarter".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Unit Type Lot".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Unit Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Employee Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Rg".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Cpf".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Contract Type".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Role".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Function".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Work Shift".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
