namespace :feeds do
  desc "TODO"
  task refresh: :environment do
  	require 'feedjira'

		urls = ['http://feeds.reuters.com/Reuters/worldNews']
		feeds = Feedjira::Feed.fetch_and_parse urls
		feed = feeds['http://feeds.reuters.com/Reuters/worldNews']
		entries = feed.entries

		# feed.entries - returns an array of Entry objects

		entries.each do |entry|
		
			summary = entry.summary	

			regex = /(.*?)\s+\(Reuters\)/
			
			entry_location = regex.match(summary)

			if entry_location
				puts entry_location[1].split("/").inspect
			end
		end
  end
end