class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string :symbol
      t.string :name
      t.string :sector
      t.float :price
      t.float :dividendYield
      t.float :priceEarnings



      t.float :earningsShare
      t.float :bookValue
      t.float :WeekLow52
      t.float :WeekHigh52
      t.float :marketCap
      t.float :eBITDA
      t.float :priceSales
      t.float :priceBook
      t.float :sECFilings


      t.timestamps
    end
  end
end
