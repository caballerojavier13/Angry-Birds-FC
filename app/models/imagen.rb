class Imagen < ActiveRecord::Base
  attr_accessible :persona_id, :updated_at, :url
 
  belongs_to :persona
end
