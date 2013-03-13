class User < ActiveRecord::Base
  attr_accessible :fisrt_name, :last_name
  
  validates_presence_of :fisrt_name, :last_name
end
