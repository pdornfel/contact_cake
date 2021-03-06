class User < ActiveRecord::Base

  validates_presence_of :first_name
  validates_presence_of :last_name

  has_many :contacts
  has_many :facts, through: :contacts

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
