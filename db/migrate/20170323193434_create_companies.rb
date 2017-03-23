class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string :symbol
      t.string :name
      t.string :sector
      t.float :price
      t.float :dividendYield
      t.float :priceEarnings

      t.timestamps
    end
  end
end
