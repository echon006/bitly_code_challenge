require './lib/users.rb'
require 'csv'
require 'json'

RSpec.describe User do

  before :each do
    @csv_rows = CSV.read('./data/encodes.csv', headers: true)
    @csv_row = @csv_rows[0]
    @user_1 = User.new(@csv_row)

    @json_file = File.read('./data/decodes.json')
    @data_hash = JSON.parse(@json_file)
  end

  describe 'initialize' do
    it "exists" do
      expect(@user_1).to be_a(User)
    end

    it "checks that all the attributes" do
      expect(@user_1.long_url).to eq('https://google.com/')
      expect(@user_1.domain).to eq('bit.ly')
      expect(@user_1.hash).to eq('31Tt55y')
    end


  end
end
