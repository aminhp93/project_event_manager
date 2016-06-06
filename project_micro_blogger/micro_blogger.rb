require 'jumpstart_auth'
require 'bitly'
require 'klout'

Klout.api_key = 'xu9ztgnacmjx3bu82warbr3h'
# idnetity = Klout::Identity.find_by_screen_name('jack')
# user = Klout::User.new(identity.id)
# user.score.score

# Bitly.use_api_version_3
# bitly = Bitly.new('hungryacademy', 'R_430e9f62250186d2612cca76eee2dbc6')
# puts bitly.shorten('http://jumpstartlab.com/courses/').short_url

class MicroBlogger
	attr_reader :client

	def initialize
		puts "Initializing MicroBlogger"
		@client = JumpstartAuth.twitter
	end

	def tweet(message)
		@client.update(message)
		puts "".ljust(140, "abcd")
	end

	def run
		puts "Welcome tothe JSL Twitter Client"
		# command = gets.chomp
		# case command
		# when 'q' then puts "Goodbye"
		# else 
		# 	puts "Sorry, I don't know how to #{command}"
		# end
		command = ""
		while command != "q"
			p "Enter Command: "
			inputs = gets.chomp
			parts = inputs.split(" ")
			command = parts[0]
			case command
			when 'q' then puts "Goodbye"
			when 't' then tweet(parts[1..-1].join(" "))
			when 'dm' then dm(parts[1], parts[2..-1].join(" "))
			when 's' then shorten(parts[1..-1].join(" "))
			when 'turl' then tweet(parts[1..-2].join(" ") + " " + shorten(parts[-1]))
			else
				puts "Sorry, I don't know how to #{command}"
			end
		end
	end

	def dm(target, message)
		puts "Trying to send #{target} this direct message"
		puts message
		screen_names = @client.followers.collect {|follower| @client.user(follower).screen_name}
		message = "d @#{target} #{message}"
		tweet(message)
	end

	def followers_list
		screen_names = []
		screen_names << @client.user(follower).screen_name
		screen_names
	end

	def everyones_last_tweet
		friends = @client.friends
		friends.each do |friend|
			tweet = friend.all_replies
			puts "#{tweet}"
		end
		timestamp = friend.status.created_at
		timestamp.strftime("%A, %b %d")
	end

	def shorten(originial_url)
		puts "Shortening this URL: #{originial_url}"
	end

	def klout_score
		friends = @client.friends.colelt{|f|} f.screen_name}
		freinds.each do |friend|
			puts "" 
		end
	end
end

blogger = MicroBlogger.new
blogger.tweet("MicroBlogger Initialized")
blogger.run
blogger.klout_score
