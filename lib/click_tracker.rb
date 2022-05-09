require './lib/clicks.rb'
require './lib/users.rb'
require 'csv'
require 'json'

class ClickTracker
  attr_reader :google_count, :company

  def initialize(data)
    @all_clicks = click_hashes(data[:clicks])
    @google_count = 0
    @github_count = 0
    @twitter_count = 0
    @reddit_count = 0
    @linkedin_count = 0
    @youtube_count = 0

  end

  def companies(data)
    csv_data = []
    @csv_rows = CSV.read(data, headers: true)
    @csv_rows.each do | row |
      user = User.new(row)
      csv_data.push(user)
    end
    csv_data
  end

  def company_long_url(data)
    long_url = []
    companies(data).each do |company|
      long_url.push(company.long_url)
    end
    long_url
  end

  def click_hashes(data)
    single_click_hash = []
    clicks = Click.clicks_in_2021
    clicks.each do |click|
        last_char = click['bitlink'].split("/").pop
        single_click_hash.push(last_char)
    end
    single_click_hash
  end

  def google_clicks
    @all_clicks.each do | click_hash |
      if click_hash == "31Tt55y"
        @google_count += 1
      end
    end
    @google_count
  end

  def github_clicks
    @all_clicks.each do | click_hash |
      if click_hash == "2kJO0qS"
        @github_count += 1
      end
    end
    @github_count
  end

  def twitter_clicks
    @all_clicks.each do | click_hash |
      if click_hash == "2kkAHNs"
        @twitter_count += 1
      end
    end
    @twitter_count
  end

  def reddit_clicks
    @all_clicks.each do | click_hash |
      if click_hash == "2kJdsg8"
        @reddit_count += 1
      end
    end
    @reddit_count
  end

  def linkedin_clicks
    @all_clicks.each do | click_hash |
      if click_hash == "2kJej0k"
        @linkedin_count += 1
      end
    end
    @linkedin_count
  end

  def youtube_clicks
    @all_clicks.each do | click_hash |
      if click_hash == "2lNPjVU"
        @youtube_count += 1
      end
    end
    @youtube_count
  end
end
