
# # class Student
# # 	attr_reader :first_name, :last_name, :courses

# # 	def initialize(first_name, last_name)
# # 		@first_name = first_name.capitalize
# # 		@last_name = last_name.capitalize
# # 		@courses = []
# # 	end

# # 	def name 
# # 		"#{first_name} #{last_name}"
# # 	end

# # 	def enroll(course)
# # 		return if self.courses.include?(course)
# # 		raise "conflict" if has_conflict?(course)

# # 		self.courses << course
# # 		course.students << self
# # 	end

# # 	def course_load
# # 		load = Hash.new(0)
# # 		self.courses.each do |i|
# # 			load[i.department] += i.credits
# # 		end
# # 		load
# # 	end

# # 	def has_conflict?(new_course)
# # 		self.courses.any? do |i|
# # 			new_course.conflicts_with?(i)
# # 		end
# # 	end
# # end

class Student

	attr_reader :first_name, :last_name, :courses

	def initialize(first_name, last_name)
		@first_name, @last_name = first_name, last_name
		@courses = []
	end

	def name
		"#{first_name} #{last_name}"
	end

	def enroll(new_course)
		return if self.courses.include?(new_course)
		rasie "error" if has_conflict?(new_course)

		@courses << new_course
		new_course.students << self
	end

	def course_load
		result = Hash.new(0)

		self.courses.each do |i|
			result[i.department] += i.credits
		end
		result
	end

	def has_conflict?(new_course)
		self.courses.any? do |i|
			new_course.conflicts_with?(i)
		end
	end
end


# class Student
# 	attr_reader :first_name, :last_name, :courses

# 	def initialize(first_name, last_name)
# 		@first_name, @last_name = first_name, last_name
	
# 		@courses = []
# 	end

# 	def name
# 		"#{first_name} #{last_name}"
# 	end

# 	def enroll(new_course)
# 		@courses << new_course unless conflict_with?(new_course)
# 		new_course.students << self
# 	end

# 	def conflict_with?(other_course)
# 		return true if @courses.include?(other_course)
# 	end


# 	def course_load
# 		result = {}
# 		self.courses.each do |i|
# 			result[i.department] += i.credits
# 		end
# 		result
# 	end
# end
