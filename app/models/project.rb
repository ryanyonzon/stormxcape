class Project < ActiveRecord::Base

  belongs_to :user
  has_many :todo
  has_many :fileshare

end
