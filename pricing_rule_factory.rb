# frozen_string_literal: true

class PricingRuleFactory
  def self.create_pricing_rule(product_code)
    case product_code
    when 'GR1'
      GreenTeaPricingRule.new
    when 'SR1'
      StrawberriesPricingRule.new
    when 'CF1'
      CoffeePricingRule.new
    else
      raise "No pricing rule defined for product code #{product_code}"
    end
  end
end
