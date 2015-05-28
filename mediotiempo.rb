load 'scraper.rb'

class Mediotiempo
  def self.get_live_games
    games = []
    doc = Scraper.new('http://m.mediotiempo.com/ticker_completo.php').fetch
    doc.css('.tickers .fila-ticker-vivo').each do |ticker|

      games << {
        local_name: ticker.css('td')[1].text.strip,
        visitor_name: ticker.css('td')[7].text.strip,
        local_goals: ticker.css('td')[2].css('td.score1').text.strip,
        visitor_goals: ticker.css('td')[2].css('td.score2').text.strip
      }
    end

    games
  end
end
