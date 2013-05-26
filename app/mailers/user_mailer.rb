class UserMailer < ActionMailer::Base
  default :from => "angrybirdfanclub@gmail.com"
  
  def registration_confirmation(persona)
    @persona = persona
    mail(:to => "#{persona.nombre} <#{persona.email}>", :subject => "Bienvenido a Angry Birds Fan Club")
  end

  def forgot_password(persona)
    @persona = persona
    mail(:to => "#{persona.nombre} <#{persona.email}>", :subject => "Reset Password")
  end
end
