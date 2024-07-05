module PricingRule
  def apply(products)
    raise NotImplementedError, 'PricingRule subclasses must implement the apply method'
  end
end
