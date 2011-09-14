require 'spec_helper'

describe "employees/show.html.haml" do
  before(:each) do
    @employee = assign(:employee, stub_model(Employee,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Unit Type/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Headquarter/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Unit Type Lot/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Unit Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Employee Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Rg/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Cpf/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Contract Type/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Role/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Function/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Work Shift/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
  end
end
