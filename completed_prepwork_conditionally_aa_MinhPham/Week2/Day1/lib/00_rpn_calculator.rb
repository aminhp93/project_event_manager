# class RPNCalculator
#   # TODO: your code goes here!
#   attr_reader :stack

#   def initialize(stack=[])
#   	@stack = stack
#   end

#   def value
#   	stack.last
#   end

#   def push(value)
#   	stack << value.to_f
#   end

#   def plus
#   	stack << pop + pop
#   end

#   def minus
#   	stack << - (pop - pop)
#   end

#   def times
#   	stack << pop * pop
#   end

#   def divide
#   	stack << 1/(pop/pop)
#   end

#   def pop 
#   	result = @stack.pop
#   	if result.nil? 
#   		raise "calculator is empty"
#   	end
#   	result
#   end

#   def tokens(string)
#   	result = []
#   	string.split(" ").collect do |i|
#   		if i == "+" || i == "-" || i == "*" || i == "\/"
#   			result << :"#{i}"
#   		else
#   			result << i.to_f
#   		end
#   	end
#   	result
#   end

#   def evaluate(string)
#   	tokens(string).each do |i|
#   		if i == :+
#   			plus
#   		elsif i == :-
#   			minus
#   		elsif i == :/
#   			divide
#   		elsif i == :*
#   			times
#   		else
#   			push(i)
#   		end
#   	end
#   	value
#   end
# end
# a = RPNCalculator.new()
# p a.evaluate("1 2 3 * + 4 5 - /")


class RPNCalculator
  attr_reader :stack

  def initialize(stack=[])
    @stack = stack
  end
  
  def value
    stack.last
  end

  def push(value)
    stack << value.to_f
  end

  def plus
    stack << pop + pop
  end

  def minus
    stack << -(pop - pop)
  end

  def times
    stack << pop * pop
  end

  def divide
    stack << 1/(pop/pop)
  end

  def pop
    result = @stack.pop
    if result.nil?
      raise "calculator is empty"
    end
    result
  end

  def tokens(string)
    result = []
    string.split(" ").collect do |i|
      if i == "+" || i == "-" || i == "*" || i == "\/"
        result << :"#{i}"
      else
        result << i.to_f
      end
    end
    result
  end

  def evaluate(string)
    tokens(string).each do |i|
      if i == :+
        plus
      elsif i == :-
        minus
      elsif i == :/
        divide
      elsif i == :*
        times
      else
        push(i)
      end
    end
    value
  end
end
