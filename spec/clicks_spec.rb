require './lib/clicks.rb'
require 'json'


RSpec.describe Click do

  before :each do
    @json_file = File.read('./data/decodes.json')
    @data_hash = JSON.parse(@json_file)
  end

  it "exists" do
    expect(@data_hash[0]).to be_a(Hash)
  end

  it "checks that all the attributes" do
    expect(@data_hash[0]["bitlink"]).to eq("http://bit.ly/2kkAHNs")
    expect(@data_hash[0]["bitlink"]).to be_a(String)
    expect(@data_hash[0]["timestamp"]).to eq("2020-02-15T00:00:00Z")
    expect(@data_hash[0]["timestamp"]).to be_a(String)
  end

  it "returns a collection of clicks made in 2021" do
    expect(Click.clicks_in_2021).to be_an(Array)
    expect(Click.clicks_in_2021.count).to eq(5082)
  end
end
