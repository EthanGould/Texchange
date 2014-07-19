class Card < ActiveRecord::Base
  include HTTParty
  belongs_to :user
  def self.response(word)
  	api_key = ENV['APIKEY']
  	api_url = "https://api.pearson.com/v2/dictionaries/ldec/entries?headword=#{word}&apikey=#{api_key}"
  	HTTParty.get(api_url)
  end

end
