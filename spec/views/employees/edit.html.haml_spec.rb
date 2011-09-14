require 'spec_helper'

describe "employees/edit.html.haml" do
  before(:each) do
    @employee = assign(:employee, stub_model(Employee,
      :unit_type => "MyString",
      :headquarter => "MyString",
      :unit_type_lot => "MyString",
      :unit_name => "MyString",
      :employee_id => 1,
      :employee_name => "MyString",
      :rg => "MyString",
      :cpf => "MyString",
      :contract_type => "MyString",
      :role => "MyString",
      :function => "MyString",
      :workload => 1,
      :work_shift => "MyString",
      :eja => false
    ))
  end

  it "renders the edit employee form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => employees_path(@employee), :method => "post" do
      assert_select "input#employee_unit_type", :name => "employee[unit_type]"
      assert_select "input#employee_headquarter", :name => "employee[headquarter]"
      assert_select "input#employee_unit_type_lot", :name => "employee[unit_type_lot]"
      assert_select "input#employee_unit_name", :name => "employee[unit_name]"
      assert_select "input#employee_employee_id", :name => "employee[employee_id]"
      assert_select "input#employee_employee_name", :name => "employee[employee_name]"
      assert_select "input#employee_rg", :name => "employee[rg]"
      assert_select "input#employee_cpf", :name => "employee[cpf]"
      assert_select "input#employee_contract_type", :name => "employee[contract_type]"
      assert_select "input#employee_role", :name => "employee[role]"
      assert_select "input#employee_function", :name => "employee[function]"
      assert_select "input#employee_workload", :name => "employee[workload]"
      assert_select "input#employee_work_shift", :name => "employee[work_shift]"
      assert_select "input#employee_eja", :name => "employee[eja]"
    end
  end
end
