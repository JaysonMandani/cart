class ShoppingCart
  attr_reader :quantity

  def initialize pricing_rules
    @pricing_rules = pricing_rules

    @item_list  = []
    @promo_code = []
  end

  def add item, promo_code=nil
    @promo_code << {promo_code: promo_code} if promo_code != nil

    if @item_list.empty? || !@item_list.any? { |hash| hash[:name] == item.name }
      @item_list << { name: item.name, quantity: 1, price: item.price, product_code: item.product_code }

      if item.product_code == 'ult_medium'
        @item_list << { name: '1 GB Data-pack', price: '0', product_code: '1gb', quantity: 1}
      end
    else
      index = @item_list.index { |item_hash| item_hash[:name] == item.name }
      @item_list.fetch(index)[:quantity] += 1

      if item.product_code == 'ult_medium'
        index = @item_list.index { |item_hash| item_hash[:product_code] == '1gb' }
        @item_list.fetch(index)[:quantity] += 1
      end
    end
  end

  def items
    @string = []

    @item_list.each do |i|
      @string << "#{i[:quantity]} x #{i[:name]}"
    end
    @string
  end

  def total
    @pricing_rules.calculate_price @item_list, @promo_code
  end
end
