#coding: utf-8
class MasterSecurityController < ApplicationController
  before_filter :authorize
  def authorize
    unless session[:usuario_id].nil?
      unless Persona.find_by_id(session[:usuario_id]).admin
        redirect_to '/'
      end
    else
      redirect_to '/puto'
    end
  end
end
