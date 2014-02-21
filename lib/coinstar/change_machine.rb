require 'active_support/inflector'
require_relative 'executable'

class ChangeMachine
  extend Executable

  CURRENCY = {penny: 1, nickel: 5, dime: 10, quarter: 25}

  def self.make_change(cents)
    raise 'You\'re going to need a bigger change machine' if cents > 100
    calculated_change = sorted_currency.each_with_object({}) do |(k,v), change|
      unless cents < v
        divisible = cents / v
        change[k.to_s.pluralize.to_sym] = divisible
        cents -= (CURRENCY[k] * divisible)
      end
    end
  end

  def self.make_cents(currency)
    begin
      currency.inject(0) do |cents, (k,v)|
        cents += (CURRENCY[k.to_s.singularize.to_sym] * v)
      end
    rescue NoMethodError
      raise 'Unknown currency type'
    end
  end

  private

  def self.sorted_currency
    Hash[CURRENCY.sort_by{|k, v| v}.reverse]
  end
end
