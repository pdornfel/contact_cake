class EmailWorker
  include Sidekiq::Worker

  def perform(contact_id)
    puts "Doing some work"
    # contact = Contact.find_by(id: contact_id)
    # puts "hello contact: #{contact.name}"
    # FollowUpMailer.delay_for(10.seconds).send_follow_up(contact).deliver
  end

end