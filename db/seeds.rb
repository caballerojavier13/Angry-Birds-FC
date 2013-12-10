persona = Persona.create!(
    nombre: "Administrado",
    apellido: "Del Sistema",
    fechaNacimiento:Date.today,
    email: "admin@angrybirdsfanclub.com",
    genero: TRUE,
    username: "admin",
    password: "admin",
    password_confirmation: "admin",
    codigo: "",
    bloqueado: false,
    activo: true,
    admin: true
)