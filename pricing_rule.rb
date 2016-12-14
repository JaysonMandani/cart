class PricingRule
  def calculate_price item_list, promo_code=nil
    @total = []

    item_list.each do |item|
      case item[:product_code]
      when 'ult_small'
        if item[:quantity] > 2
          @total << (item[:quantity] - 1) * item[:price].to_f
        else
          @total << item[:quantity].to_i * item[:price].to_f
        end
      when 'ult_large'
        if item[:quantity] > 3
          @total << (item[:quantity].to_i * 39.90)
        else
          @total << item[:quantity].to_i * item[:price].to_f
        end
      else
        @total << item[:quantity].to_i * item[:price].to_f
      end
    end

    unless promo_code.empty?
      if promo_code[0][:promo_code].eql? 'I<3AMAYSIM'
        "$#{(@total.sum - (@total.sum * 0.1)).round(2)}"
      else
        puts "promo code is invalid"
        "$#{@total.sum.round(2)}"
      end
    else
      "$#{@total.sum.round(2)}"
    end

  end
end
