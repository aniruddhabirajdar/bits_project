json.extract! company, :id, :symbol, :name, :sector, :price, :dividendYield, :priceEarnings, :created_at, :updated_at
json.url company_url(company, format: :json)