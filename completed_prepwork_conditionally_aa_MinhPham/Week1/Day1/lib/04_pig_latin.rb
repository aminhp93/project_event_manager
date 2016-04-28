# def translate(word)
# 	vowels = %w[a e i o u]
# 	result = word.split.map do |a|
# 		i = 0
# 		while !vowels.include?(a[i,1])
# 			if a[i,2] == "qu"
# 				i += 2
# 			else
# 				i += 1
# 			end
# 		end
# 		a[i..-1] + a[0, i] + "ay"
# 	end
# 	result.join(" ")
# end 


def translate(string)
	words = string.split(" ")
	vowels = %w[a e i o u]
	result = words.collect do |word|
		i = 0
		while !vowels.include?(word[i, 1])
			if word[i, 2] == "qu"
				i += 2
			else
				i += 1
			end
		end
		word[i..-1] + word[0, i] + "ay"
	end
	result.join(" ")
end