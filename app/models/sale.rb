class Sale
  attr_accessor :last_name, :sale_value

  def self.read_sales(filename)
    sales = []
    CSV.foreach(filename, headers:true) do |row|
      sales << Sale.new(row["last_name"], row["gross_sale_value"].to_f)
    end
    sales
  end

  def initialize(last_name, sale_value)
    @last_name = last_name
    @sale_value = sale_value
  end
end