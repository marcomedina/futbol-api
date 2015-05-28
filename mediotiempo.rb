load 'scraper.rb'

class Mediotiempo
  URL = 'http://m.mediotiempo.com/ticker_completo.php'

  def self.elements_to_games(elements, game_status)
    games = []
    elements.each do |ticker|
      games << {
        local_name: ticker.css('td')[1].text.strip.encode("iso-8859-1").force_encoding("utf-8"),
        visitor_name: ticker.css('td')[7].text.strip.encode("iso-8859-1").force_encoding("utf-8"),
        local_goals: ticker.css('td')[2].css('td.score1').text.strip,
        visitor_goals: ticker.css('td')[2].css('td.score2').text.strip,
        time: ticker.css('td')[2].css('tr')[1].text.strip,
        status: game_status
      }
    end
    games
  end

  def self.get_all_games
    games = []
    doc = Scraper.new(URL).fetch
    games << self.elements_to_games(doc.css('.tickers .fila-ticker-vivo'), 'live')
    games << self.elements_to_games(doc.css('.tickers .fila-ticker'), 'coming')
    games.flatten
  end

  def self.get_live_games
    games = []
    doc = Scraper.new(URL).fetch
    self.elements_to_games(doc.css('.tickers .fila-ticker-vivo'), 'live')
  end

  def self.get_coming_games
    games = []
    doc = Scraper.new(URL).fetch
    self.elements_to_games(doc.css('.tickers .fila-ticker'), 'coming')
  end
end
