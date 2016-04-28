class XmlDocument
	attr_reader :indent_depth

	def initialize(indent=false)
		@indent = indent
		@indent_depth = 0

	end

	def method_missing(name, *attrs, &blk)
		attrs = attrs.first || {}
		render_tag(name, attrs, &blk)
	end

	def render_tag(name, attrs, &blk)
		result = ""

		if block_given?
			result << open_tag(name, attrs)
			indent
			result << blk.call
			unindent
			result << close_tag(name)
		else
			result << lone_tag(name, attrs)
		end
		
	end

	def open_tag(name, attrs)
		"#{tabspace}<#{body_string(name, attrs)}>#{newline}"
	end

	def close_tag(name)
		"#{tabspace}</#{name}>#{newline}"
	end

	def lone_tag(name, attrs)
		"#{tabspace}<#{body_string(name, attrs)}/>#{newline}"
	end

	def body_string(name, attrs)
		([name] + attr_string(attrs)).join(" ")
	end

	def indent
		@indent_depth += 1 if @indent
	end

	def unindent
		@indent_depth -= 1 if @indent
	end

	def attr_string(attrs)
		attrs.collect {|key, value| "#{key}=\"#{value}\""}
	end

	def tabspace
		"  " * @indent_depth
	end

	def newline
		@indent ? "\n" : ""
	end

end


