require 'nokogiri'
require 'typhoeus'
# load 'cache.rb'

class Scraper
  def initialize(url)
    @url = url
  end

  def fetch
    # Enable Cache
    # Typhoeus::Config.cache = Cache.new
    @response = Typhoeus.get(@url)
    @doc = Nokogiri::HTML(@response.body)
  end
end
