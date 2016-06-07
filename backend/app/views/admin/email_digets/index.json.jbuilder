json.array!(@email_digets) do |email_diget|
  json.extract! email_diget, :id, :email
  json.url email_diget_url(email_diget, format: :json)
end
