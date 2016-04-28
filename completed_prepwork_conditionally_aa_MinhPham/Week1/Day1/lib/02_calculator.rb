# def add(num1, num2)
# 	num1 + num2
# end

# def subtract(num1, num2)
# 	num1 - num2
# end

# def sum(array)
# 	sum = array.inject(0){|sum, i| sum + i}
# 	sum
# end

# def multiply(array)
# 	result = array.inject(1){|result, i| result*i}
# 	result
# end

# def power(num, power)
# 	num**power
# end

# def factorial(n)
# 	result = 1
# 	return 1 if n == 0
# 	i = 1
# 	while i <= n
# 		result *= i
# 		i += 1
# 	end
# 	result
# end

def add(x, y)
	x + y
end

def subtract(x, y)
	x - y
end

def sum(array)
	return 0 if array == []
	array.inject(&:+)
end

def multiply(array)
	array.inject(&:*)
end

def power(x, y)
	x ** y
end

def factorial(n)
	return 1 if n == 0
	result = 1
	1.upto(n) do |i|
		result *= i
	end
	result
end




