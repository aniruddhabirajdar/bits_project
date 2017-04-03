class CompanyRecommender

  def initialize company, companies
    @company, @companies = company, companies
  end

  def recommendations

    # Map jaccard_index to each item and sort array
    recommended_companies=@companies.map do |this_company|

      # We can define jaccard_index getter in runtime as singleton...
      this_company.define_singleton_method(:jaccard_index) do
        @jaccard_index
      end

      # also setter
      this_company.define_singleton_method("jaccard_index=") do |index|
        @jaccard_index = index || 0.0
      end

      # Calculate intersection between sets
      intersection = (@company.tag_list & this_company.tag_list).size
      # ... and union
      union = (@company.tag_list | this_company.tag_list).size

      # Assign the division and rescue if division is not possible with 0
      this_company.jaccard_index = (intersection.to_f / union.to_f) rescue 0.0

      this_company

      # Sort items

    end
    recommended_companies.sort_by { |company| 1 - company.jaccard_index }
  end


end