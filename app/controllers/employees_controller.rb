class EmployeesController < ApplicationController
  def index

    @sales =  Sale.read_sales(Rails.root.join('db/data/sales.csv'))
    @employees = Employee.read_employees(Rails.root.join('db/data/employees.csv'))

    # make your employee objects available to the correlating view here
  end
end
