#coding: utf-8
class InicioController < SecurityController
  def start
  	@persona = Persona.find(session[:usuario_id])
    @videos = Video.all.last(6)
    @imagenes = Imagen.all.last(5)
    @noticias = Noticium.all.last(4)
  end
end
