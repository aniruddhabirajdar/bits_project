class Company < ApplicationRecord
  self.per_page = 30
  has_many :reports
  scope :find_by_sector, -> (sector) { where(sector:  sector) }
  def get_yahoo_data
    StockQuote::Stock.quote(self.symbol)
  end

end
