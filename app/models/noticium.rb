#coding: utf-8
class Noticium < ActiveRecord::Base
  attr_accessible :cuerpo, :imagen_id, :persona_id, :titulo, :updated_at

  belongs_to :persona
  
  belongs_to :imagen

  has_many :calificaciones
  has_many :comentarios
  has_many :notificaciones

  validate :titulo_must_be_present
  validate :cuerpo_must_be_present
  validate :titulo_must_be_unique
  
  def titulo_must_be_present
    self.titulo = self.titulo.capitalize
    self.titulo.gsub! /\s+/, ' '
    self.titulo.split(' ').join(' ')
    errors.add(" ", "El titulo no puede estar en blanco.") unless self.titulo.present?
  end
  def cuerpo_must_be_present
    errors.add(" ", "Debe escribir algo en el texto de la noticia.") unless self.cuerpo.present?
  end
  def titulo_must_be_unique
    
    if titulo.present?
      self.titulo = self.titulo.capitalize
      self.titulo.gsub! /\s+/, ' '
      self.titulo.split(' ').join(' ')
      @NoticiaEncontrado = Noticium.find_all_by_titulo(titulo).at(0)
      unless @NoticiaEncontrado.nil?
        unless @NoticiaEncontrado.id == self.id
          errors.add(" ", "Ya se encuentra una noticia con el mismo título, por favor cámbialo por otro.")
        end  
      end
    end
  end
end
