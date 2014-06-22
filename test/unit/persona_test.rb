require 'test_helper'

class PersonaTest < ActiveSupport::TestCase
  Persona.create!(
      nombre: "usuario-activo-bloqueado",
      apellido: "Test",
      fechaNacimiento:Date.today,
      email: "usuario-activo-bloqueado@angrybirdsfanclub.com",
      genero: TRUE,
      username: "usuario-activo-bloqueado",
      password: "123456",
      password_confirmation: "123456",
      codigo: "",
      bloqueado: true,
      activo: true,
      admin: false,
      role_id: 2
  )
end
