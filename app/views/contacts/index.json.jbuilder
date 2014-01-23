json.array!(@contacts) do |contact|
  json.extract! contact, :id, :user_id, :group, :name, :phone
  json.url contact_url(contact, format: :json)
end
