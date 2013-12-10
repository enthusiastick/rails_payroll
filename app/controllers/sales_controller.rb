class SalesController < ApplicationController
  def index
    # make your sales objects available to the correlating view here
    @sales =  Sale.read_sales(Rails.root.join('db/data/sales.csv'))
    @employees = Employee.read_employees(Rails.root.join('db/data/employees.csv'))
  end
end
