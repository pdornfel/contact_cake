class Fact < ActiveRecord::Base

  validates_presence_of :fact

  belongs_to :contact


end
