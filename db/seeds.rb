# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#destroy old roles and users

User.destroy_all
Role.destroy_all
p "old data has been deleted"
#Create Roles
Role.create!([{name: "Admin",symbol_name:"admin"},{name: "investor",symbol_name:"investor"},{name: "analyst",symbol_name:"analyst"}])
#Create Admin
User.create!({:email => "admin@test.com", :roles => [Role.where(symbol_name:"admin").first], :password => "welcome123", :password_confirmation => "welcome123" })
#Create Users
(0...100).each do |number|
  User.create!({:email => Faker::Internet.email, :roles => [Role.where.not(symbol_name:"admin").sample], :password => "welcome123", :password_confirmation => "welcome123" })
end
p "#{User.count} users has been created including admin"

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
  p "Company Data has been inserted"

p "--------------------------------------------------------------------------"
Report.destroy_all
p "Genrate reports"
(0...1000).each do |number|
  report=Report.create!(title: Faker::Lorem.sentences(1).first,recommandation:["BUY","SELL"].sample,report_text: Faker::Lorem.paragraph(500),target:Faker::Number.decimal(2, 3),company_id: Company.all.map(& :id).sample,user_id: User.analystes.sample.id)
  p "#{number}. #{report.recommandation} #{report.company.name} at #{report.target} by #{report.user.email}"
end
p "report has been genrated"








