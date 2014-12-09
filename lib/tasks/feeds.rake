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
		
			e = Entry.create!(summary: entry.summary, title: entry.title, url: entry.url)	

			regex = /(.*?)\s+\(Reuters\)/
			entry_location = regex.match(e.summary)

			if entry_location
				locations = entry_location[1].split("/")

				e.locations = locations.map{|l| Location.new(city: l)}
			end

			e.save
		end
  end
end