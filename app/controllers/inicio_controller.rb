class InicioController < SecurityController
  def start
	@persona = Persona.find(session[:usuario_id])

  end
end
