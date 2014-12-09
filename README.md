MEWS: Mapped News
=================

Ruby Version 2.0.0
Rails Version 4.1.7

This MEWS App takes the latest 10 news from Reuters RSS feed.
Each news entries are displayed on a map using the Google Maps Embed API.

------

*Fetching and Parsing Feeds*
Feeds are fetched and parsed using 'feedjira' gem

		urls = ['http://feeds.reuters.com/Reuters/worldNews']
		feeds = Feedjira::Feed.fetch_and_parse urls
		feed = feeds['http://feeds.reuters.com/Reuters/worldNews']
		entries = feed.entries

Feeds are refreshed once a day within tasks/feeds.rake

*Display of news entries*
The top 10 news are defined in the controller as:

		@entries = Entry.limit(10).order(created_at: :desc)

Location for each entry is defined by grabbing the city information, present at each news entry:

		regex = /(.*?)\s+\(Reuters\)/
		entry_location = regex.match(e.summary)

Each location is displayed on the map using the Google Maps Embed API:

         <iframe
               width="200"
               height="125"
               frameborder="1" style="border:0"
               src="https://www.google.com/maps/embed/v1/place?key=AIzaSyDUGXb9ZtDbM0lwnaLQCSVzh_Za48_2XgI
               &q=<%= location.city %>">  
         </iframe>

*Future Improvements:*
* Improve feeds regex in cases where cities are undefined
* Improve feeds regex in cases where '(Reuters)' is not present
* Display news items on the same map, with links to the article
* Add categories for news entries (politics, entertainment, sports, etc.)
* Improve UI! It desparately needs love.
