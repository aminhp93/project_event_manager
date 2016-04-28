# class Fixnum
# 	def in_words
# 		h = {1 => "one", 2 => "two", 3 => "three", 4 => "four", 5 => "five", 6 => "six", 7 => "seven", 8 => "eight", 9 => "nine", 10 => "ten", 11 => "eleven", 12 => "twelve", 13 => "thirteen", 14 => "fourteen", 15 => "fifteen", 16 => "sixteen", 17 => "seventeen", 18 => "eighteen", 19 => "nineteen", 20 => "twenty", 30 => "thirty", 40 => "forty", 50 => "fifty", 60 => "sixty", 70 => "seventy", 80 => "eighty", 90 => "ninety"}
# 		result = ""
# 		if  self >= 1_000_000_000_000
# 			result = "#{h[self/1_000_000_000_000]} trillion"
# 			if self % 1_000_000_000_000 > 0
# 				result = "#{result} #{(self % 1_000_000_000_000).in_words}"
# 			end

# 		elsif self >= 1_000_000_000
# 			result = "#{h[self/1_000_000_000]} billion"
# 			if self % 1_000_000_000 > 0
# 				result = "#{result} #{(self % 1_000_000_000).in_words}"
# 			end

# 		elsif self >= 1_000_000
# 			result = "#{h[self/1_000_000]} million"
# 			if self % 1_000_000 > 0
# 				result = "#{result} #{(self % 1_000_000).in_words}"
# 			end

# 		elsif self >= 1_000
# 			result = "#{h[self/1_000]} thousand"
# 			if self % 1_000 > 0
# 				result = "#{result} #{(self % 1_000).in_words}"
# 			end

# 		elsif self >= 100
# 			result = "#{h[self/1_00]} hundred"
# 			if self % 100 > 0
# 				result = "#{result} #{(self % 100).in_words}"
# 			end

# 		elsif self > 20
# 			result = "#{h[(self/10) * 10]} #{h[self%10]}"

# 		else 
# 			result = h[self]
# 		end
# 		result 
# 	end
# end
ONES = { 0 => "zero", 1 => "one", 2 => "two", 3 => "three", 4 => "four", 5 => "five", 6 => "six", 7 => "seven", 8 => "eight", 9 => "nine"}

TEENS = {10 => "ten", 11 => "eleven", 12 => "twelve", 13 => "thirteen", 14 => "fourteen", 15 => "fifteen", 16 => "sixteen", 17 => "seventeen", 18 => "eighteen", 19 => "nineteen"}

TENS = {20 => "twenty", 30 => "thirty", 40 => "forty", 50 => "fifty", 60 => "sixty", 70 => "seventy", 80 => "eighty", 90 => "ninety"}

BIG_NUMBERS = {100 => "hundred", 1000 => "thousand", 1_000_000 => "million", 1_000_000_000 => "billion", 1_000_000_000_000 => "trillion"}

class Fixnum
	def in_words

		if self < 10
			ONES[self]
		elsif self < 20
			TEENS[self]
		elsif self < 100
			tens_word = TENS[(self/10) * 10]
			if self % 10 != 0
				tens_word + " " + (self % 10).in_words
			else
				tens_word
			end
		else
			big_number = BIG_NUMBERS.keys.take_while {|i| i <= self}.last
			result = (self/big_number).in_words + " " + BIG_NUMBERS[big_number]
			if self % big_number != 0
				result + " " + (self % big_number).in_words
			else
				result
			end
		end
	end
end
