class Book
  # TODO: your code goes here!
  def title
  	no_need = %w[a the an and or in of ]
  	words = self.split(" ")
  	result = []
  	i = 0
  	while i < words.length
  		if i == 0
  			result << i.capitalize
  		elsif no_need.include?(words[i])
  			result << i.capitalize
  		else
  			result << i
  		end
  		i += 1
  	end
  	result.join(" ")
  end
end
