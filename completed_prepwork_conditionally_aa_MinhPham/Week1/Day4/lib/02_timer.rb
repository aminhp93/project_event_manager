class Timer
	attr_accessor :seconds

	def initialize(seconds = 0)
		@seconds = seconds
	end

	def time_string
		second = padded(@seconds % 60)
		minute = padded((@seconds % 3600) / 60)
		hour = padded(@seconds / 3600)
		result = hour.to_s + ":" + minute.to_s + ":" + second.to_s
		result 
	end

	def padded(num)
		result = ""
		if num >= 10
			result = num.to_s
		else 
			result = "0" + num.to_s
		end
		result
	end
end



