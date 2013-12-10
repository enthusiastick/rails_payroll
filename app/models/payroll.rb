require 'csv'
require 'pry'
require_relative 'employee'
require_relative 'commission_sales_person'
require_relative 'quota_sales_person'
require_relative 'owner'
require_relative 'sale'

employees = Employee.read_employees('employees.csv')
sales =  Sale.read_sales('sales.csv')

#binding.pry
employees.each do |employee|
  employee.find_sales(sales) if employee.class == CommissionSalesPerson || employee.class == QuotaSalesPerson
  employee.find_company_sales_total(sales) if employee.class == Owner
  puts
  puts "***#{employee.last_name}***"
  puts "Job Title: #{employee.job_title.capitalize}"
  puts "Gross Salary: #{employee.gross_salary.round(2)}"
  puts "Commission: #{employee.commission.round(2)}" if employee.class == CommissionSalesPerson
  puts "Bonus: #{employee.bonus.round(2)}" if employee.class == QuotaSalesPerson || employee.class == Owner
  puts "Net Pay: #{employee.net_pay.round(2)}"
end
