require './lib/click_tracker.rb'

RSpec.describe ClickTracker do
  before :each do
    @user_path = './data/encodes.csv'
    @click_path = './data/decodes.json'

    @data = {
      users: @user_path,
      clicks: @click_path
    }

    @click_tracker = ClickTracker.new(@data)
  end

  it "exists" do
    expect(@click_tracker).to be_a(ClickTracker)
  end

  it "checks that companies are all users " do
    expect(@click_tracker.companies('./data/encodes.csv')).to be_a(Array)
  end

  it "grabs only the companies long url " do
    expect(@click_tracker.company_long_url('./data/encodes.csv')).to be_a(Array)
  end

  it "checks for count of clicks for a company" do
    expect(@click_tracker.google_clicks).to eq(492)
    expect(@click_tracker.github_clicks).to eq(497)
    expect(@click_tracker.twitter_clicks).to eq(512)
    expect(@click_tracker.reddit_clicks).to eq(510)
    expect(@click_tracker.linkedin_clicks).to eq(496)
    expect(@click_tracker.youtube_clicks).to eq(557)
  end
end
