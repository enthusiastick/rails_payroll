require 'csv'

class Employee
attr_accessor :last_name, :base_salary, :job_title

  def self.read_employees(filename)
    employees = []
    CSV.foreach(filename, headers:true) do |row|
      if row["job title"] == "commission sales person"
        employees << CommissionSalesPerson.new(row["last name"], row["base salary"].to_f, row["job title"], row["commission"].to_f)
      elsif row["job title"] == "quota based sales person"
        employees << QuotaSalesPerson.new(row["last name"], row["base salary"].to_f, row["job title"], row["quota"].to_f, row["bonus"].to_f)
      elsif row["job title"] == "owner"
        employees << Owner.new(row["last name"], row["base salary"].to_f, row["job title"], row["bonus"].to_f)
      else
        employees << Employee.new(row["last name"], row["base salary"].to_f, row["job title"])
      end
    end
    employees
  end

job_title, commission=nil, quota=nil, bonus=nil

  def initialize(last_name, base_salary, job_title)
    @last_name = last_name
    @base_salary = base_salary
    @job_title = job_title
  end

  def to_s
    "#{self.class} = class
    #{@last_name} = last_name
    #{@base_salary} = base_salary
    #{@job_title} = job_title"
  end

  def net_pay
    gross_salary-(0.3*gross_salary)
  end

  def gross_salary
    @base_salary/12
  end
end


