class Funtions < ActiveRecord::Base
  attr_accessible :name
  belongs_to :permission
end
