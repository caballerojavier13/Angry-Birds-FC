class PermissionsController < ApplicationController
  # GET /permissions
  # GET /permissions.json
  def index
    @roles = Role.order('name ASC')
    functions = Arel::Table.new(:functions)
    permisos = Arel::Table.new(:permissions)

    @si_funciones = functions.where(functions[:id].in(permisos.where(permisos[:role_id].eq(@roles.first.id)).project(Arel.sql('function_id')))).order('name ASC').project(Arel.sql('*'))
    @no_funciones = functions.where(functions[:id].not_in(permisos.where(permisos[:role_id].eq(@roles.first.id)).project(Arel.sql('function_id')))).order('name ASC').project(Arel.sql('*'))

  end
  def add_all_function
    functions = Arel::Table.new(:functions)
    permisos = Arel::Table.new(:permissions)
    rol = params[:role]
    @no_funciones = functions.where(functions[:id].not_in(permisos.where(permisos[:role_id].eq(rol)).project(Arel.sql('function_id')))).order('name ASC').project(Arel.sql('*'))
    @no_funciones.to_a.each  do |f|
      p = Permissions.new
      p.role_id = rol
      p.function_id = f.id
      p.save
    end
    respond_to do |format|
      format.js
    end
  end
  def add_one_function
    p = Permissions.new
    p.role_id = params[:role]
    p.function_id = params[:function]
    p.save
    respond_to do |format|
      format.js
    end
  end
  def remove_one_function
    Permissions.destroy Permissions.where(role_id: params[:role], function_id: params[:function])

    respond_to do |format|
      format.js
    end
  end
  def remove_all_function
    functions = Arel::Table.new(:functions)
    permisos = Arel::Table.new(:permissions)
    rol = params[:role]
    @si_funciones = functions.where(functions[:id].in(permisos.where(permisos[:role_id].eq(rol)).project(Arel.sql('function_id')))).order('name ASC').project(Arel.sql('*'))
    @si_funciones.to_a.each  do |f|
      p = Permissions.where(role_id: rol, function_id: f.id)
      p.destroy(p)
    end
    respond_to do |format|
      format.js
    end
  end
  def change_rol
    rol = params[:role]
    functions = Arel::Table.new(:functions)
    permisos = Arel::Table.new(:permissions)

    @si_funciones = functions.where(functions[:id].in(permisos.where(permisos[:role_id].eq(rol)).project(Arel.sql('function_id')))).order('name ASC').project(Arel.sql('*'))
    @no_funciones = functions.where(functions[:id].not_in(permisos.where(permisos[:role_id].eq(rol)).project(Arel.sql('function_id')))).order('name ASC').project(Arel.sql('*'))
    respond_to do |format|
      format.js
    end
  end
end
