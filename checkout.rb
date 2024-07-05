# frozen_string_literal: true

require_relative 'example_usage'
require_relative 'product'
require_relative 'pricing_rule_factory'
require_relative 'pricing_rule'
require_relative 'specific_pricing_rules'

class Checkout
  def initialize
    @cart = Hash.new { |hash, key| hash[key] = [] }
  end

  def scan(product)
    @cart[product.code] << product
  end

  def total
    total_price = 0.0
    @cart.each do |product_code, products|
      pricing_rule = PricingRuleFactory.create_pricing_rule(product_code)
      total_price += pricing_rule.apply(products)
    end
    total_price
  end
end
