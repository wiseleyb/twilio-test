json.array!(@contact_groups) do |contact_group|
  json.extract! contact_group, :id, :user_id, :group_name
  json.url contact_group_url(contact_group, format: :json)
end
