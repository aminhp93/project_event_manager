# def echo(str)
# 	str
# end

# def shout(str)
# 	str.upcase
# end

# def repeat(str, n=2)
# 	i = 2
# 	result = "#{str}"
# 	while i <= n
# 		result += " " + str
# 		i += 1
# 	end
# 	result
# end

# def start_of_word(str, n)
# 	char = str.split("")
# 	result = ""
# 	i = 0
# 	while i <= n -1 
# 		result << char[i]
# 		i += 1
# 	end
# 	result
# end

# def first_word(str)
# 	words = str.split(" ")
# 	words[0]
# end	

# def titleize(str)
# 	words = str.split(" ")
# 	no_need = %w[and over the a an]
# 	result = []
# 	i = 0
# 	while i < words.length 
# 		if i == 0 
# 			result << words[i].capitalize
# 		elsif !no_need.include?(words[i])
# 			result << words[i].capitalize
# 		else
# 			result << words[i]
# 		end
# 		i += 1
# 	end
# 	result.join(" ")
# end

def echo(string)
	"#{string}"
end

def shout(string)
	string.upcase
end

def repeat(string, n=2)
	result = "#{string}"
	i = 1
	while i < n
		result += " " + "#{string}"
		i += 1
	end
	result
end

def start_of_word(string, n)
	string[0..(n-1)]
end

def first_word(string)
	string.split(" ")[0]
end

def titleize(string)
	untitle = %w[ and over the a an ]
	words = string.split(" ")
	result = []
	i = 0
	while i < words.length
		if i == 0
			result << words[i].capitalize
		elsif !untitle.include?(words[i])
			result << words[i].capitalize
		else
			result << words[i]
		end
		i += 1
	end
	result.join(" ")
end
