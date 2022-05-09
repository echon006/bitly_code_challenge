require './lib/clicks.rb'
require './lib/users.rb'
require './lib/click_tracker.rb'
require 'csv'
require 'json'

def start
  @user_path = './data/encodes.csv'
  @click_path = './data/decodes.json'

  @data = {
    users: @user_path,
    clicks: @click_path
  }

  @click_tracker = ClickTracker.new(@data)

 p ['https://google.com/': @click_tracker.google_clicks,
  'https://github.com/': @click_tracker.github_clicks,
  'https://twitter.com/': @click_tracker.twitter_clicks,
  'https://reddit.com/': @click_tracker.reddit_clicks,
  'https://linkedin.com/': @click_tracker.linkedin_clicks,
  'https://youtube.com/': @click_tracker.youtube_clicks]
end
start
