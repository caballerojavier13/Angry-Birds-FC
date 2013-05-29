class Video < ActiveRecord::Base
  attr_accessible :persona_id, :titulo, :updated_at, :url

  belongs_to :persona
  
  def self.search(page)
    paginate :per_page => 5, :page => page
  end
end
