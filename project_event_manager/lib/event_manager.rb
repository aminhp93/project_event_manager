require "csv"

puts "EventManager Initialized"

contents = CSV.open "event_attendees.csv", headers: true
contents.each do |row|
	name = row[:first_name]
	puts name
end


