class CommissionSalesPerson < Employee
  #an array of a particular salesperson's sale objects
  attr_accessor :sales

  def initialize(last_name, base_salary, job_title, commission_rate)
    super(last_name, base_salary, job_title)
    @commission_rate = commission_rate
  end

  def find_sales(sales)
    @sales = []
    sales.each do |sale|
      if self.last_name == sale.last_name
        @sales << sale
      end
    end
    @sales
  end

  def commission
    total = 0.0
    @sales.each do |sale|
      total += sale.sale_value
    end
    @commission_rate*total
  end

  def gross_salary
    super + commission
  end
end
