class User
  attr_reader :long_url, :domain, :hash

  def initialize(data)
    @long_url = data['long_url']
    @domain = data['domain']
    @hash = data['hash']
  end
end
