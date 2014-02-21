module Executable
  def run(args)
    result = self.send(args[:argument], args[:params]) if self.respond_to? args[:argument]
    display(result)
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
    params.each_with_object({}) do |param, hash|
      array = param.split('=')
      hash[array.first.to_sym] = array.last.to_i
    end
  end

  def display(result)
    if result.is_a? Hash
      result.map { |k,v| "#{k}: #{v}" }
    else
      result
    end
  end
end
