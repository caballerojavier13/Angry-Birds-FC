#coding: utf-8
class InicioController < SecurityController
  def start
  	@persona = Persona.find(session[:usuario_id])
    @videos = Video.all.last(6)
    @imagenes = Imagen.all.last(5)
    @noticias = Noticium.order('id ASC').last(4)
    @notificaciones = Notification.where("`read` = ? AND persona_id = ?", false, session[:usuario_id])


    novelty = Arel::Table.new(:novelties)
    usr_novelty = Arel::Table.new(:usr_novelties)
    resultado = novelty
    .join(usr_novelty)
    .on(usr_novelty[:novelty_id]
        .eq(novelty[:id]))
    .where(Arel.sql('usr_novelties.viewed = false AND usr_novelties.persona_id = ' + @persona.id.to_s)).project(Arel.sql('novelties.id, novelties.message, novelties.created_at'))

    @novelties = resultado.to_a


  end
end
