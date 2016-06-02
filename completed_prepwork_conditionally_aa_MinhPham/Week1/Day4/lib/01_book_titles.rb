class Book
  # TODO: your code goes here!
  def title
    @title
  end

  def title=(title)
  	no_need = %w[a the an and or in of ]
  	words = title.split(" ")
  	result = []
  	i = 0
  	while i < words.length
  		if i == 0
  			result << words[i].capitalize
  		elsif no_need.include?(words[i])
  			result << words[i]
  		else
  			result << words[i].capitalize
  		end
  		i += 1
  	end
  	@title = result.join(" ")
  end
end

# class Book
#   def title
#     no_need = %w[in a an the over and]
#     words = self.split
#     i = 0
#     result = []
#     while i < words.length
#       if (i == 0) && (!no_need.include?(words[i]))
#         result << words[i]
#       else
#         result << words[i].capitalize
#       end
#       i += 1
#     end
#     result.join(" ")
#   end
# end