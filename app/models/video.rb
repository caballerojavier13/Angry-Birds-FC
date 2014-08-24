#coding: utf-8
class Video < ActiveRecord::Base
  attr_accessible :persona_id, :titulo, :updated_at, :url

  belongs_to :persona
  
  validate :titulo_must_be_present
  validate :url_must_be_valid
  validate :titulo_must_be_unique
  validate :url_must_be_unique
  
  def titulo_must_be_present
    self.titulo = self.titulo.capitalize
    self.titulo.gsub! /\s+/, ' '
    self.titulo.split(' ').join(' ')
    errors.add(" ", "El titulo no puede estar en blanco.") unless self.titulo.present?
  end
  
  def url_must_be_valid
    unless (self.url =~ /^(https?:\/\/)?(www\.)?youtube.com\/(embed(\/)|watch[?]v=)([a-z0-9-]+)/i)==0
      errors.add(" ", "Dirección de Youtube inválida. Recuerde que solo se aceptan videos de youtube.")
    else
      self.url = VideoInfo.get(self.url).embed_url
    end
  end
  def titulo_must_be_unique
    if titulo.present?
      self.titulo.gsub! /\s+/, ' '
      self.titulo.split(' ').join(' ')
      @videoEncontrado = Video.find_all_by_titulo(titulo).at(0)
      unless @videoEncontrado.nil?
        unless @videoEncontrado.id == self.id
          errors.add(" ", "Ya se encuentra un video con el mismo título, por favor cámbialo por otro.")
        end  
      end
    end
  end
  def url_must_be_unique
    if url.present?
      @videoEncontrado = Video.find_all_by_url(url).at(0)
      unless @videoEncontrado.nil?
        unless @videoEncontrado.id == self.id
          errors.add(" ", "Este video ya ha sido subido.") 
        end  
      end
      
    end
  end
  def self.search( parametro )
    parametro = parametro
    Video.where("titulo LIKE :param", {:param => "%#{parametro}%"})
  end
  def self.titulo
    return titulo.capitalize
  end  
end
