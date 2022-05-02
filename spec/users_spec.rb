require './lib/users.rb'
require 'csv'


RSpec.describe User do

before :each do
  @rows = CSV.read('./data/encodes.csv', headers: true)
  @row = @rows[0]
  @user_1 = User.new(@row)
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
