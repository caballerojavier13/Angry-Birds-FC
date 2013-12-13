#coding: utf-8
class AdminController < MasterSecurityController

  def index
    @all_personas = Persona.all
    @usu_gen_f = Persona.activo.where("genero = ?", false).count.to_s
    @usu_gen_m = Persona.activo.where("genero = ?", true).count.to_s
    @usu_gen_t = @usu_gen_f.to_i + @usu_gen_m.to_i
    
    @usu_act_bloq = Persona.activo.where("bloqueado = ?", false).count.to_s
    @usu_act_no_bloq = (Persona.activo.count - @usu_bloq.to_i).to_s

    @usu_act_bloq = Persona.bloqueado.count.to_s
    @usu_act_no_bloq = (@all_personas.count.to_i - @usu_act_bloq.to_i).to_s

    @usu_act = Persona.activo.count.to_s
    @usu_act_t = @all_personas.count.to_s

    @edades = Array.new()

    @all_personas.each do  |p|
      @edades.push (p.getEdad)
    end

    @cuenta_edades = [0,0,0,0,0,0,0,0,0,0]
    @edades.each do |e|
      if(e<10)
        @cuenta_edades[0] +=1
      else
        if(e<20)
          @cuenta_edades[1] += 1
        else
          if(e<30)
            @cuenta_edades[2] += 1
          else
            if(e<40)
              @cuenta_edades[3] += 1
            else
              if(e<50)
                @cuenta_edades[4] += 1
              else
                if(e<60)
                  @cuenta_edades[5] += 1
                else
                  if(e<70)
                    @cuenta_edades[6] += 1
                  else
                    if(e<80)
                      @cuenta_edades[7] += 1
                    else
                      if(e<90)
                        @cuenta_edades[8] += 1
                      else
                        @cuenta_edades[9] += 1
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end

    @Progreso_usu = Array.new(12)

    (0..12).to_a.each do |i|
      @Progreso_usu[i] = Persona.activo.where(
          'created_at >= :inicio AND created_at < :fin',
          inicio: i.month.ago, fin: (i-1).month.ago
      ).count
    end
    @Progreso_usu.delete_at 0

    (0..11).to_a.reverse!.each do |i|
      @Progreso_usu[i] += @Progreso_usu[i+1].to_i
    end
    @Progreso_usu.reverse!

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @user }
    end
  end

  def user


      if params[:act].to_s == "true"
        act = TRUE
      else
        act = FALSE
      end

      if params[:bloq].to_s == "true"
        bloq = TRUE
      else
        bloq = FALSE
      end

      if params[:admin].to_s == "true"
        admin = TRUE
      else
        admin = FALSE
      end


      if params[:act].nil?
          @usuarios = Persona.order('id ASC').paginate(:page => params[:page], :per_page => 10)
      else
        @usuarios = Persona.where(
            'lower("nombre") LIKE :nom AND lower("apellido") LIKE :ape AND lower("username") LIKE :user AND lower("email") LIKE :mail AND activo = :act AND bloqueado = :bloq AND admin = :admin',
            nom: '%'+params[:nom].to_s.downcase+'%', ape: '%'+params[:ape].to_s.downcase+'%', user: '%'+params[:user].to_s.downcase+'%', mail: '%'+params[:mail].to_s.downcase+'%', act: act, bloq: bloq, admin: admin
        ).order('id ASC').paginate(:page => params[:page], :per_page => 10)
      end

  end

  def user_edit
    @usuario = Persona.find params[:id]
    @year_fin = Date.today.year
    @year_inicio = @year_fin - 100
    @etiqueta = (0..12).to_a
    @etiqueta.to_a.reverse!

    @Progreso_not = Array.new(12)

    (0..12).to_a.each do |i|
      @Progreso_not[i] = Noticium.where(
          'created_at >= :inicio AND created_at < :fin AND persona_id = :persona_id',
          inicio: i.month.ago, fin: (i-1).month.ago, persona_id: @usuario.id
      ).count
    end
    @Progreso_not.delete_at 0
    @Progreso_not.reverse!

    @Progreso_img = Array.new(12)

    (0..12).to_a.each do |i|
      @Progreso_img[i] = Imagen.where(
          'created_at >= :inicio AND created_at < :fin AND persona_id = :persona_id',
          inicio: i.month.ago, fin: (i-1).month.ago, persona_id: @usuario.id
      ).count
    end
    @Progreso_img.delete_at 0
    @Progreso_img.reverse!

    @Progreso_vid = Array.new(12)

    (0..12).to_a.each do |i|
      @Progreso_vid[i] = Video.where(
          'created_at >= :inicio AND created_at < :fin AND persona_id = :persona_id',
          inicio: i.month.ago, fin: (i-1).month.ago, persona_id: @usuario.id
      ).count
    end
    @Progreso_vid.delete_at 0
    @Progreso_vid.reverse!


    @total_n = Noticium.where(
        'persona_id = :persona_id',
        persona_id: @usuario.id
    ).count
    @total_i = Imagen.where(
        'persona_id = :persona_id',
        persona_id: @usuario.id
    ).count
    @total_v = Video.where(
        'persona_id = :persona_id',
        persona_id: @usuario.id
    ).count
  end


  def change_atributo
    @persona = Persona.find params[:id]
    @persona.change_data_account(params[:atributo],params[:valor])
  end


  def notice
    @noticias = Noticium.order('id ASC').paginate(:page => params[:page], :per_page => 10)
  end
end

