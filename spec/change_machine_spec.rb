require 'spec_helper'

describe ChangeMachine do
  it 'sorts the currency by the largest denomination' do
    expect(ChangeMachine::CURRENCY).to eq( {quarter: 25, dime: 10, nickel: 5, penny: 1} )
  end

  context 'Makes change from a given amount of cents and returns a currency set' do
    it 'for 1' do
      change = ChangeMachine.make_change(1)
      expect(change).to eq( {pennies: 1} )
    end

    it 'for 16' do
      change = ChangeMachine.make_change(16)
      expect(change).to eq( {dimes: 1, nickels: 1, pennies: 1} )
    end

    it 'for 23' do
      change = ChangeMachine.make_change(23)
      expect(change).to eq( {dimes: 2, pennies: 3} )
    end

    it 'for 98' do
      change = ChangeMachine.make_change(98)
      expect(change).to eq( {quarters: 3, dimes: 2, pennies: 3} )
    end
  end

  context 'Makes change for quantities up to 100 cents'
  context 'Makes cents from a given amount of currency and returns as a total number of cents'
  context 'Takes input from the command line'
end
