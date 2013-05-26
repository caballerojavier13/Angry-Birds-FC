class Video < ActiveRecord::Base
  attr_accessible :persona_id, :titulo, :updated_at, :url

  belongs_to :persona
end
