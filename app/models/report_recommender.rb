class ReportRecommender

  def initialize report, reports
    @report, @reports = report, reports
  end

  def recommendations

    # Map jaccard_index to each item and sort array
    recommended_reports=@reports.map do |this_report|

      # We can define jaccard_index getter in runtime as singleton...
      this_report.define_singleton_method(:jaccard_index) do
        @jaccard_index
      end

      # also setter
      this_report.define_singleton_method("jaccard_index=") do |index|
        @jaccard_index = index || 0.0
      end

      # Calculate intersection between sets
      intersection = (@report.tag_list & this_report.tag_list).size
      # ... and union
      union = (@report.tag_list | this_report.tag_list).size

      # Assign the division and rescue if division is not possible with 0
      this_report.jaccard_index = (intersection.to_f / union.to_f) rescue 0.0

      this_report

      # Sort items

    end
    recommended_reports.sort_by { |report| 1 - report.jaccard_index }
  end


end