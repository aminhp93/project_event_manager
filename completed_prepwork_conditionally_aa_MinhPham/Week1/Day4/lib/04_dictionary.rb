# class Dictionary
#   # TODO: your code goes here!
#   attr_accessor :entries

#   def initialize(entries = {})
#   	@entries = entries
#   end

#   def add(entry)
#   	if entry.class == String
#   		entry = {entry => nil}
#   	end

#   	entry.each do |key, value|
#   		@entries[key] = value
#   	end
#   end

#   def keywords
#   	result = []
#   	@entries.each do |key, value|
#   		result << key
#   	end
#   	result.sort
#   end

#   def include?(key)
#   	@entries.keys.include?(key)
#   end

#   def find(prefix)
#   	result = {}
#   	@entries.each do |key, value|
#   		if key =~ /^#{prefix}/
#   			result[key] = value
#   		end
#   	end
#   	result
#   end

#   def printable
#   	result = []
#   	@entries.sort.collect do |key, value|
#   		result << "[#{key}] \"#{value}\""
#   	end
#   	result.join("\n")
#   end
  
# end

class Dictionary
  def entries
    @entries
  end

  def initialize
    @entries = Hash.new(0)
  end

  def add(entries)
    if entries.class == String
      entries = {entries => nil}
    end

    entries.each do |key, value|
      @entries[key] = value
    end
  end

  def keywords
    @entries.keys.sort
  end

  def include?(keys)
    return false unless @entries.keys.include?(keys)
    true
  end

  def find(string)
    result = Hash.new(0)
    @entries.each do |key, value|
      result[key] = value if key =~ /^#{string}/
    end
    result
  end

  def printable
    result = []
    @entries.sort.each do |key, value|
      result << "[#{key}] \"#{value}\""
    end
    result.join("\n")
  end

end














