class QuotaSalesPerson < Employee
  attr_reader :sales, :bonus_value

  def initialize(last_name, base_salary, job_title, quota, bonus_value)
    super(last_name, base_salary, job_title)
    @quota = quota
    @bonus_value = bonus_value
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

  def bonus
    total = 0.0
    @sales.each do |sale|
      total += sale.sale_value
    end
    if total > @quota
      @bonus_value
    else
      0
    end
  end

  def gross_salary
    unless bonus == 0
      super + @bonus_value
    else
      super
    end
  end
end