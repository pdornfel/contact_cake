class Contact < ActiveRecord::Base

  validates_presence_of :name, null: false

  belongs_to :user, dependent: :destroy

  has_many :facts


end