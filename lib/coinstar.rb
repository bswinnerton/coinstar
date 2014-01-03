require 'coinstar/change_machine'

def pass_arguments
  ARGV.each_slice(2) do |method, parameter|
    sanitized_arg = method.gsub('--', '')
    if sanitized_arg == 'make_change'
      puts ChangeMachine.make_change(parameter.to_i)
    elsif sanitized_arg == 'make_cents'
      cents = ARGV.drop(1).inject({}) do |cents, arg|
        cent = arg.split('=')
        cents[cent[0].to_sym] = cent[1].to_i
        cents
      end
      puts ChangeMachine.make_cents(cents)
    end
  end
end
