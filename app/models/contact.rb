class Contact < ActiveRecord::Base

  belongs_to :user, dependent: :destroy


end