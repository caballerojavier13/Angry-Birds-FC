class Role < ActiveRecord::Base
  attr_accessible :name
  has_one :permissions
  has_one :persona

end
