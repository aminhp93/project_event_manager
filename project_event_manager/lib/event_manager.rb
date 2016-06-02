puts "EventManager Initialized"

# lines = File.readlines "event_attendees.csv"
# lines.each do |line|
# 	next if line == " ,RegDate,first_Name,last_Name,Email_Address,HomePhone,Street,City,State,Zipcode\n"
# 	columns = line.split(",")
# 	name = columns[2]
# 	puts name
# end

lines = File.readlines "event_attendees.csv"
lines.each_with_index do |line, index|
	next if index == 0
	columns = line.split(",")
	name = columns[2]
	puts name
end