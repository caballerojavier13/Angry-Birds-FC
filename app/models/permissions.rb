class Permissions < ActiveRecord::Base
  attr_accessible :role_id, :function_id
  belongs_to :role
  belongs_to :function

  def Permissions.permiso persona_id, nombre_funcion
    functions = Arel::Table.new(:functions)
    permisos = Arel::Table.new(:permissions)
    roles = Arel::Table.new(:roles)

    personas = Arel::Table.new(:personas)

    rol = personas.where(personas[:id].eq(persona_id)).project(Arel.sql('role_id'))
    funcion = functions.where(functions[:name].eq(nombre_funcion)).take(1).project(Arel.sql('id'))

    acceso = permisos.join(roles).on(permisos[:role_id].eq(Arel.sql("(#{(rol.to_sql)})"))).join(functions).on(permisos[:function_id].eq(Arel.sql("(#{(funcion.to_sql)})"))).project(Arel.sql('*'))

    return acceso.to_a.size > 0? true:false
  end
end
