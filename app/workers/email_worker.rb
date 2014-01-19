class EmailWorker
  include Sidekiq::Worker

  def perform(contact_id)
    contact = Contact.find_by(id: contact_id)
    puts "hello contact: #{contact.name}"
    FollowUpMailer.delay_for(3.days).send_follow_up(contact)
  end

end