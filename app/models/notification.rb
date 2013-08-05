class Notification < ActiveRecord::Base
  attr_accessible :mensaje, :noticia_id, :read, :usuario_id, :usuarios

  belongs_to :persona
  belongs_to :noticium
  
  def self.noticia_propia
    return self.get_usuarios + " comentaron en tu noticia:" + '"'+ self.mensaje + '""'
  end
  def self.noticia_otro
    return self.get_usuarios + " comentaron en la noticia:" + '"'+ self.mensaje + '""'
  end
  
  def get_usuarios 
    lista_usuarios = usuarios.split(",")
    if lista_usuarios.count > 1
      resultado = lista_usuario.at(0)
      lista_usuarios[1,lista_usuario.count].each { |e| resultado = resultado + ", " + e }
      resultado = resultado + " y " + lista_usuario.last
      return resultado
    else
      return lista_usuarios[0]
    end
  end
  def self.agregar_usuario usuario
    if usuarios.nil?
      self.usuarios = usuario
    else
      self.usuarios = self.usuarios + "," + usuario
    end    
  end
  def actualizar_notificacion usuario
    lista_usuarios = self.usuarios + ','+ usuario
    self.update_attribute(:usuarios, lista_usuarios)
  end
end
