class MessageWorker
  include Sidekiq::Worker

  def perform(contact_group_id, message)
    ContactGroup.find(contact_group_id).send_text_messages(message)
  end
end
