#coding: utf-8
class SecurityController < ApplicationController
  before_filter :authorize

  def authorize

    unless cookies[:usuario_id].to_i != 0
      redirect_to '/login?redirect_to='+ request.original_url.to_s, :alert => 'Por favor inicie sesion.'
    else
      session[:usuario_id] = cookies[:usuario_id].to_i
      session[:genero] = cookies[:genero].to_i
      cookies[:usuario_id]= { :value => session[:usuario_id].to_i, :expires => 1.week.from_now }
      cookies[:genero]= { :value => session[:genero].to_i, :expires => 1.week.from_now }
      if Persona.find_by_id(session[:usuario_id]).nil?
        redirect_to'/login?redirect_to='+ request.original_url.to_s, :alert => 'Por favor inicie sesion.'
      end
    end
  end
end
