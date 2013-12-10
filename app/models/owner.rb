class Owner < Employee
attr_reader :bonus_value, :sales_total

  def initialize(last_name, base_salary, job_title, bonus_value)
    super(last_name, base_salary, job_title)
    @bonus_value = bonus_value
  end

  def bonus
    if @sales_total>250000
      @bonus_value
    else
      0
    end
  end

  def gross_salary
    super + bonus
  end

  def find_company_sales_total(sales)
    @sales_total = 0.0
    sales.each do |sale|
      @sales_total += sale.sale_value
    end
    @sales_total
  end
end