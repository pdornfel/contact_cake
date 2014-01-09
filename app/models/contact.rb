class Contact < ActiveRecord::Base

  mount_uploader :contact_photo, ContactPhotoUploader

  belongs_to :user
  has_many :facts

  validates_presence_of :name

end
