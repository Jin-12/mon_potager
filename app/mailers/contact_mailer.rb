class ContactMailer < ApplicationMailer

  def garden_contact_email(contact_params)
    @user = contact_params[:user]
    @url  = 'https://mon-potager.herokuapp.com/'
    mail(to: @user.email, subject: "Nouveau message de ... sur monpotager.com" )
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message, :captcha)
  end

end
