class Staff < ActiveRecord::Base
  belongs_to :user

  has_many :ranchstaffs
  has_many :ranches, :through => :ranchstaffs
  
end
