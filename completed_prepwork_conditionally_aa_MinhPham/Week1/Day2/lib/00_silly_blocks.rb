# def reverser
# 	str = yield
# 	words = str.split(" ")
# 	result = words.collect{|i| i.reverse}
# 	result.join(" ")
# end

# def adder(n=1)
# 	yield + n
# end

# def repeater(n=1)
# 	n.times do 
# 		yield
# 	end
# end

def reverser
	string = yield
	words = string.split(" ")
	result = words.collect{|i| i.reverse}
	result.join(" ")
end

def adder(n=1)
	yield + n
end

def repeater(n=1)
	n.times do 
		yield
	end
end