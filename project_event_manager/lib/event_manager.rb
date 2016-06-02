puts "EventManager Initialized"

# content = File.read "event_attendees.csv"
# puts content

# lines = File.readlines "event_attendees.csv"
# lines.each do |line|
# 	columns = lines.split(",")
# 	puts line
# end

lines = File.readline "event_attendees.scv"
lines.each do |line|
	columns = line.split(",")
	name = columns[2]
	# puts columns
	puts name
end