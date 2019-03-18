class UserMailer < ApplicationMailer
  default from: 'no-reply@monpotager.fr'
 
  def welcome_email(user)
    @user = user

    @url  = 'https://mon-potager.herokuapp.com/'

    mail(to: @user.email, subject: 'Bienvenue sur terre !')
  end
end
