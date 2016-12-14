require 'active_support'
require 'active_support/core_ext'
require './pricing_rule.rb'
require './item.rb'
require './shopping_cart.rb'

item1 = Item.new('Unlimited 1GB', 'ult_small', '24.90')
item2 = Item.new('Unlimited 2GB', 'ult_medium', '29.90')
item3 = Item.new('Unlimited 5GB', 'ult_large', '44.90')
item4 = Item.new('1 GB Data-pack', '1gb', '9.90')

promo_code = 'I<3AMAYSIM'

pricingRules = PricingRule.new

cart = ShoppingCart.new(pricingRules)
puts "Scenario 1"
cart.add(item1)
cart.add(item1)
cart.add(item1)
cart.add(item3)
puts cart.items
puts cart.total

cart = ShoppingCart.new(pricingRules)
puts "Scenario 2"
cart.add(item1)
cart.add(item1)
cart.add(item3)
cart.add(item3)
cart.add(item3)
cart.add(item3)
puts cart.items
puts cart.total

cart = ShoppingCart.new(pricingRules)
puts "Scenario 3"
cart.add(item2)
cart.add(item2)
cart.add(item1)
puts cart.items
puts cart.total

cart = ShoppingCart.new(pricingRules)
puts "Scenario 4"
cart.add(item1)
cart.add(item4, promo_code)
puts cart.items
puts cart.total
