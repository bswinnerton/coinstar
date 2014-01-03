require 'active_support/inflector'

class ChangeMachine
  CURRENCY = {penny: 1, nickel: 5, dime: 10, quarter: 25}

  def self.make_change(cents)
    raise 'You\'re going to need a bigger change machine' if cents > 100
    calculated_change = sorted_currency.inject({}) do |change, (k,v)|
      unless cents < v
        divisible = cents / v
        change[k] = divisible
        cents = cents - (CURRENCY[k] * divisible)
      end
      change
    end
    pluralize(calculated_change)
  end

  def self.make_cents(currency)
    currency.inject(0) do |cents, (k,v)|
      cents += (CURRENCY[singularize(k)] * v)
      cents
    end
  end

  private

  def self.sorted_currency
    Hash[CURRENCY.sort_by{|k, v| v}.reverse]
  end

  def self.pluralize(hash)
    hash.inject({}) do |plural_hash, (k,v)|
      plural_key = k.to_s.pluralize
      plural_hash[plural_key.to_sym] = v
      plural_hash
    end
  end

  def self.singularize(symbol)
    symbol.to_s.singularize.to_sym
  end
end
