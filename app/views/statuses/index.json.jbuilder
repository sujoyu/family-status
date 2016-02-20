json.array!(@statuses) do |status|
  json.extract! status, :id, :user, :question, :answer, :created
  json.url status_url(status, format: :json)
end
