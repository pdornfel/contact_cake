class Contact < ActiveRecord::Base

  mount_uploader :contact_photo, ContactPhotoUploader

  belongs_to :user
  has_many :facts

  validates_presence_of :name

  def self.look_up(param)
    if param
      Contact.joins("LEFT OUTER JOIN facts ON contacts.id = facts.contact_id")
        .where("facts.fact ILIKE '%#{param}%' OR contacts.name ILIKE '%#{param}%'").distinct.order(created_at: :desc)

      # Contact.find_by_sql("SELECT *.contacts FROM contacts LEFT OUTER JOIN facts ON contacts.id = facts.contact_id WHERE facts.fact ILIKE '%#{param}%' OR contacts.name ILIKE '%#{param}%'")
    else
      all.order(created_at: :desc)
    end

  end

end



 # SELECT contacts.name, facts.fact  FROM contacts JOIN facts ON contacts.id = facts.contact_id WHERE facts.fact = parameter OR contacts.name = parameter;
