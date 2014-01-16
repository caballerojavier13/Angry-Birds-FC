#coding: utf-8
class InicioController < SecurityController
  def start
  	@persona = Persona.find(session[:usuario_id])
    @videos = Video.all.last(6)
    @imagenes = Imagen.all.last(5)
    @noticias = Noticium.order('id DESC').last(4)
    @notificaciones = Notification.where("read = ? AND persona_id = ?", false, session[:usuario_id])
  end
end
