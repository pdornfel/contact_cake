class Contact < ActiveRecord::Base

  validates_presence_of :name, null: false
  validates_uniqueness_of :name
  belongs_to :user, dependent: :destroy
  has_many :facts


end