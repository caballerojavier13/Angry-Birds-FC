#coding: utf-8
class AdminController < MasterSecurityController

  def index
    @all_personas = Persona.all
    @usu_gen_f = Persona.activo.where("genero = ?", false).count.to_s
    @usu_gen_m = Persona.activo.where("genero = ?", true).count.to_s
    @usu_gen_t = @usu_gen_f.to_i + @usu_gen_m.to_i
    
    @usu_act_bloq = Persona.activo.where("bloqueado = ?", false).count.to_s
    @usu_act_no_bloq = (Persona.activo.count - @usu_bloq.to_i).to_s

    @usu_act_bloq = Persona.activo.where("bloqueado = ?", false).count.to_s
    @usu_act_no_bloq = (Persona.activo.count - @usu_bloq.to_i).to_s

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
      @Progreso_usu[i] = Persona.where(
          'created_at >= :inicio AND created_at < :fin ',
          inicio: i.month.ago, fin: (i-1).month.ago
      ).count
    end

    @Progreso_usu.delete_at 0
    @Progreso_usu.reverse!

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @user }
    end
  end
end

