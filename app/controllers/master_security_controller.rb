#coding: utf-8
class MasterSecurityController < ApplicationController
   
  private 

  def only_admin
    redirect_to "/start", :alert => "Acceso no autorizado."
  end
  
  def only_owner_and_admin
    redirect_to "/start", :alert => "Acceso no autorizado."
  end  
end
