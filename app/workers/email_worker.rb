class EmailWorker
  include Sidekiq::Worker

  def perform(contact_id)
    contact = Contact.find_by(id: contact_id)
    puts "hello contact with id of: #{contact.name}"
    FollowUpMailer.send_follow_up(contact).deliver
  end

end