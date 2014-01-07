require 'spec_helper'

describe ChangeMachine do
  context 'Makes change from a given amount of cents and returns a currency set' do
    it 'given 1' do
      change = ChangeMachine.make_change(1)
      expect(change).to eq( {pennies: 1} )
    end

    it 'given 16' do
      change = ChangeMachine.make_change(16)
      expect(change).to eq( {dimes: 1, nickels: 1, pennies: 1} )
    end

    it 'given 23' do
      change = ChangeMachine.make_change(23)
      expect(change).to eq( {dimes: 2, pennies: 3} )
    end

    it 'given 98' do
      change = ChangeMachine.make_change(98)
      expect(change).to eq( {quarters: 3, dimes: 2, pennies: 3} )
    end
  end

  context 'Makes change for quantities up to 100 cents' do
    it 'gracefully handles quanities larger than 100' do
      expect { ChangeMachine.make_change(102) }.to raise_error 'You\'re going to need a bigger change machine'
    end
  end

  context 'Makes cents from a given amount of currency and returns as a total number of cents' do
    it 'given 1 penny' do
      currency = {pennies: 1}
      cents = ChangeMachine.make_cents(currency)
      expect(cents).to eq( 1 )
    end

    it 'given 2 dimes, 1 nickle, and 3 pennies' do
      currency = {dimes: 2, nickels: 1, pennies: 3}
      cents = ChangeMachine.make_cents(currency)
      expect(cents).to eq( 28 )
    end

    it 'given 1 quarter, and 1 dime' do
      currency = {quarters: 1, dimes: 1}
      cents = ChangeMachine.make_cents(currency)
      expect(cents).to eq( 35 )
    end

    it 'given 1 quarter, 2 dimes and 2 pennies' do
      currency = {quarters: 1, dimes: 2, pennies: 2}
      cents = ChangeMachine.make_cents(currency)
      expect(cents).to eq( 47 )
    end

    it 'gracefully fails if the currency is unknown' do
      currency = {pesos: 1}
      expect { ChangeMachine.make_cents(currency) }.to raise_error 'Unknown currency type'
    end
  end

  context 'Takes input from the command line' do
    it 'makes change' do
      clean_input = ChangeMachine.clean_input(['--make_change', '98'])
      expect(ChangeMachine.run(clean_input)).to eq( ['quarters: 3', 'dimes: 2', 'pennies: 3'] )
    end

    it 'makes cents' do
      clean_input = ChangeMachine.clean_input(['--make_cents', 'quarters=3', 'dimes=2', 'pennies=3'])
      expect(ChangeMachine.run(clean_input)).to eq( 98 )
    end

    it 'displays change nicely in the terminal' do
      clean_input = ChangeMachine.clean_input(['--make_change', '76'])
      expect(ChangeMachine.run(clean_input)).to eq( ['quarters: 3', 'pennies: 1'] )
    end

    it 'gracefully fails if an argument isn\'t set' do
      expect { ChangeMachine.clean_input([]) }.to raise_error 'Please enter either --make_change or --make_cents'
    end

    it 'gracefully fails if parameters aren\'t set with make_change' do
      expect { ChangeMachine.clean_input(["--make_change"]) }.to raise_error 'Please enter the change amount'
    end

    it 'gracefully fails if parameters aren\'t set with make_cents' do
      expect { ChangeMachine.clean_input(["--make_cents"]) }.to raise_error 'Please enter the cents as quarters=25 format'
    end
  end
end
