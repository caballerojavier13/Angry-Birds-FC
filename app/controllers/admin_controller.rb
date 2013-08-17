#coding: utf-8
class AdminController < MasterSecurityController

  def index
    @usu_gen_f = Persona.activo.where("genero = ?", false).count.to_s
    @usu_gen_m = Persona.activo.where("genero = ?", true).count.to_s
    @usu_gen_t = @usu_gen_f.to_i + @usu_gen_m.to_i
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @user }
    end
  end
end

