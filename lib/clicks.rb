class Click

  def self.clicks_in_2021
    clicks = []
    @json_file = File.read('./data/decodes.json')
    @data_hash = JSON.parse(@json_file)
    @data_hash.each do | click |
      click.each do | k , v |
        if k == "timestamp" && v.split('')[0..3].join == '2021'
          clicks.push(click)
        end
      end
    end
    clicks
  end
end
