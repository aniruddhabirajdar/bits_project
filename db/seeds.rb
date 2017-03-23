# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  #Fetch data from Json
require 'csv'
Company.destroy_all
p "Compny db has been cleard"
csv_text = File.read("public/company.csv")
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  Company.create!(symbol: row["Symbol"],
                  name: row["Name"],
                  sector: row["Sector"],
                  price: row["Price"],
                  dividendYield: row["Dividend Yield"],
                  priceEarnings: row["Price/Earnings"],
                  earningsShare: row["Earnings/Share"],
                  bookValue: row["Book Value"],
                  WeekLow52: row["52 week low"],
                  WeekHigh52: row["52 week high"],
                  marketCap: row["Market Cap"],
                  eBITDA: row["EBITDA"],
                  priceSales: row["Price/Sales"],
                  priceBook: row["Price/Book"],
                  sECFilings: row["SEC Filings"]
              )
end
  p "Data has been inserted"









