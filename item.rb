class Item
  attr_reader :name, :price, :product_code

  def initialize name, product_code, price
    @name         = name
    @product_code = product_code
    @price        = price
  end
end
