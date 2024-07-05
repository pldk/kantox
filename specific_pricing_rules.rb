# frozen_string_literal: true

class GreenTeaPricingRule
  include PricingRule

  def apply(products)
    count = products.size
    price_per_item = products.first.price
    (count / 2 + count % 2) * price_per_item
  end
end

class StrawberriesPricingRule
  include PricingRule

  def apply(products)
    count = products.size
    price_per_item = count >= 3 ? 4.50 : 5.00
    count * price_per_item
  end
end

class CoffeePricingRule
  include PricingRule

  def apply(products)
    count = products.size
    price_per_item = count >= 3 ? products.first.price * (2.0 / 3.0) : products.first.price
    count * price_per_item
  end
end
