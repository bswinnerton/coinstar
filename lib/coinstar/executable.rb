module Executable
  def run(args)
    self.send(args[:argument], args[:params]) if self.respond_to? args[:argument]
  end

  def clean_input(args)
    arg, params = args.group_by { |a| a.include? '--' }.values

    begin
      arg = arg.first.gsub('--', '').to_sym
    rescue NoMethodError
      raise 'Please enter either --make_change or --make_cents'
    end
    begin
      params = params.first.to_i if arg == :make_change
      params = params_to_hash(params) if arg == :make_cents
    rescue NoMethodError
      raise 'Please enter the change amount' if arg == :make_change
      raise 'Please enter the cents as quarters=25 format' if arg == :make_cents
    end

    {argument: arg, params: params}
  end

  private

  def params_to_hash(params)
    params.inject({}) do |hash, param|
      cents = param.split('=')
      hash[cents.first.to_sym] = cents.last.to_i
      hash
    end
  end
end
