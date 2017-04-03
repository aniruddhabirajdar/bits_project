class Company < ApplicationRecord
  self.per_page = 10
  has_many :reports
  scope :find_by_sector, -> (sector) { where(sector:  sector) }

end
