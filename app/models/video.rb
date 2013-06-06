#coding: utf-8
class Video < ActiveRecord::Base
  attr_accessible :persona_id, :titulo, :updated_at, :url

  belongs_to :persona
  
  validate :titulo_must_be_present
  validate :url_must_be_valid
  
  def titulo_must_be_present
    self.titulo = self.titulo.capitalize
    self.titulo.gsub! /\s+/, ' '
    self.titulo.split(' ').join(' ')
    errors.add(" ", "El titulo no puede estar en blanco.") unless self.titulo.present?
  end
  
  def url_must_be_valid
    unless (self.url =~ /^(https?:\/\/)?(www\.)?youtube.com\/watch\?v=([a-z0-9-]+)/i)==0
      errors.add(" ", "Dirección de Youtube inválida. Recuerde que solo se aceptan videos de youtube.")
    else
      self.url = VideoInfo.get(self.url).embed_url
    end
  end
  def self.search(page)
    paginate :per_page => 5, :page => page
  end
end
