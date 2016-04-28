class Temperature
  # TODO: your code goes here!
  def Temperature.from_celsius(celsius)
  	Temperature.new(c: celsius)
  end

  def Temperature.from_fahrenheit(fahrenheit)
  	Temperature.new(f: fahrenheit)
  end

  def initialize(option={})
  	@celsius = option[:c] || (option[:f] - 32) * 5 / 9.0
  	@fahrenheit = option[:f] || option[:c] * 9.0 /5 + 32
  end

  def in_celsius
  	@celsius
  end

  def in_fahrenheit
  	@fahrenheit
  end

  def Temperature.ctof(celsius)
  	celsius * 9.0/5 + 32
  end

  def Temperature.ftoc(fahrenheit)
  	(fahrenheit-32)*5/9.0
  end
end

class Celsius < Temperature
	def initialize(celsius)
		super(c: celsius)
	end
end

class Fahrenheit < Temperature
	def initialize(fahrenheit)
		super(f: fahrenheit)
	end
end


