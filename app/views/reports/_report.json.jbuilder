json.extract! report, :id, :title, :recommandation, :report_text, :target, :created_at, :updated_at
json.url report_url(report, format: :json)