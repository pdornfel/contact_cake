class Contact < ActiveRecord::Base

  belongs_to :user
  has_many :facts

  validates_presence_of :name

end
