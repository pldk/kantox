# frozen_string_literal: true

require_relative 'checkout'
require_relative 'product'

def test_checkout(basket, expected_total)
  co = Checkout.new
  basket.each { |product| co.scan(product) }
  total = co.total
  if (total - expected_total).abs < 0.01
    puts "Basket: #{basket.map(&:code).join(', ')}, Total price: £#{'%.2f' % total}"
  else
    puts "Test failed: expected £#{'%.2f' % expected_total}, got £#{'%.2f' % total}"
  end
end

green_tea = Product.new('Green Tea', 'GR1', 3.11)
strawberries = Product.new('Strawberries', 'SR1', 5.00)
coffee = Product.new('Coffee', 'CF1', 11.23)

test_checkout([green_tea, strawberries, green_tea, green_tea, coffee], 22.45)
test_checkout([green_tea, green_tea], 3.11)
test_checkout([strawberries, strawberries, green_tea, strawberries], 16.61)
test_checkout([green_tea, coffee, strawberries, coffee, coffee], 30.57)
