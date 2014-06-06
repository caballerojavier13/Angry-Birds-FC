class Permissions < ActiveRecord::Base
  attr_accessible :role_id, :function_id
  belongs_to :role
  belongs_to :function
end
