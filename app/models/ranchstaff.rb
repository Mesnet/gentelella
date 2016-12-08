class Ranchstaff < ActiveRecord::Base

  belongs_to :ranch
  belongs_to :staff

  
end
