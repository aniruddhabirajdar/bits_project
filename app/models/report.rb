class Report < ApplicationRecord
  belongs_to :company
  acts_as_taggable


  before_save :add_keywords

  scope :find_by_companies, -> (companies) { where(company_id:  companies) }
  scope :with_out, -> (report) { where.not(id:  report) }

  def add_keywords
    text=Highscore::Content.new self.report_text
    tags=text.keywords.top(50).map(& :text)
    tags.push(self.company.sector)
    tags.push(self.recommandation)
    self.tag_list.add(tags.flatten)
  end

  def get_related_reports_by_sector
    Report.find_by_companies(Company.find_by_sector(self.company.sector)).with_out(self)
  end

  def recommend_reports
    ReportRecommender.new(self,self.get_related_reports_by_sector).recommendations
  end

end
