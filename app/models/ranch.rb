class Ranch < ActiveRecord::Base
  belongs_to :users
  
  has_many :staffs, :through => :ranchstaffs

  has_many :tasks 


  scope :myranch, -> { where(user_id: current_user.id) }

end
