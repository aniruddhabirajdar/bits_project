class CreateReports < ActiveRecord::Migration[5.0]
  def change
    create_table :reports do |t|
      t.string :title
      t.string :recommandation
      t.text :report_text
      t.float :target
      t.integer :company_id
      t.timestamps
    end
  end
end
