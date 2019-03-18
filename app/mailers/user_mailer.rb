class UserMailer < ApplicationMailer
  default from: 'no-reply@monpotager.fr'
 
  def welcome_email(user)
    @user = user

    @url  = 'https://mon-potager-staging.herokuapp.com/'

    mail(to: @user.email, subject: 'Bienvenue sur terre !')
    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
  end
end
