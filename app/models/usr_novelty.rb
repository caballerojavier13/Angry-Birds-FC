#coding: utf-8
class UsrNovelty < ActiveRecord::Base
  attr_accessible :novelty_id, :persona_id, :viewed

  belongs_to :persona

  belongs_to :novelty

  scope :no_vista, -> { where :viewed => false }

end
