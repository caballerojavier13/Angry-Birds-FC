require 'test_helper'
class MyTest < ActiveSupport::TestCase

  Persona.create!(
      nombre: "usuario-test-común",
      apellido: "Test",
      fechaNacimiento:Date.today,
      email: "usuario-test-comun@angrybirdsfanclub.com",
      genero: TRUE,
      username: "usuario-test-comun",
      password: "123456",
      password_confirmation: "123456",
      codigo: "",
      bloqueado:false,
      activo: true,
      admin: false,
      role_id: 2
  )


  Noticium.create!(
      cuerpo: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus laoreet orci nec neque ultrices, non vestibulum nulla tempus. Etiam interdum condimentum risus sed elementum. Mauris fermentum pellentesque elit ac tempor. Maecenas bibendum congue varius. Quisque in ullamcorper lectus, id suscipit quam. Mauris nec ligula cursus, interdum ligula ac, euismod dolor. Morbi ligula felis, condimentum id tristique at, ullamcorper eu urna. In non purus purus. Donec ac tempus odio, eu iaculis dolor. Fusce aliquet porta turpis vitae suscipit. Pellentesque pretium tincidunt urna, sed blandit massa scelerisque vel. Nam vehicula quam sit amet metus scelerisque bibendum. Nulla consectetur faucibus felis, porta mollis ante consequat id. Nunc ac lectus vitae nisl tristique fermentum a eget quam. Nulla facilisi.

Vivamus ultrices convallis ante vel blandit. Nulla adipiscing velit vitae lacus mollis, sit amet porta lacus pharetra. Vivamus tincidunt nisl libero, ac mollis velit placerat aliquam. Vivamus placerat diam et sapien rhoncus, vel convallis ipsum volutpat. In varius, nisl quis tincidunt accumsan, tellus eros elementum enim, et pretium ligula libero nec nibh. Phasellus euismod elit sit amet pulvinar vehicula. Nullam id dolor et odio imperdiet commodo at eget ligula. Suspendisse odio eros, lobortis nec sagittis at, feugiat at risus. Vivamus a quam ullamcorper, viverra arcu.',
      persona_id: '4',
      titulo: 'Noticia de Prueba'
  )
end