#coding: utf-8

class Notification < ActiveRecord::Base
  attr_accessible :mensaje, :noticia_id, :read, :persona_id, :usuarios

  belongs_to :persona
  belongs_to :noticia
  
  def noticia_propia
    if self.usuarios.split(",").count > 1
      return self.get_usuarios + " comentaron en tu noticia: " + '"'+ self.mensaje + '"'
    else
      return self.get_usuarios + " comentó en tu noticia: " + '"'+ self.mensaje + '"'
    end
    
  end
  def noticia_otro
    
    if self.usuarios.split(",").count > 1
      return self.get_usuarios + " comentaron en la noticia: " + '"'+ self.mensaje + '"'
    else
      return self.get_usuarios + " comentó en la noticia: " + '"'+ self.mensaje + '"'
    end
  end
  
  def get_usuarios 
    lista_usuarios = usuarios.split(",")
    if lista_usuarios.count > 1
      resultado = lista_usuarios.at(0)
      lista_usuarios[1,lista_usuarios.count-2].each { |e| resultado = resultado + ", " + e }
      resultado = resultado + " y " + lista_usuarios.last
      return resultado
    else
      return lista_usuarios[0]
    end
  end

  def actualizar_notificacion usuario
    lista_usuarios = self.usuarios + ','+ usuario
    lista_usuarios = lista_usuarios.split(",").uniq
    resultado = lista_usuarios.at(0)
    lista_usuarios[1,lista_usuarios.count-1].each { |e| resultado = resultado + ", " + e }
    self.update_attribute(:usuarios, resultado)
  end
  
  def mark_as_read
    self.update_attribute(:read, true)
  end
end
