class UserContactMailer < ApplicationMailer

  def contact_garden(contact_params)
    @sender = User.find(contact_params[:current_user_id])
    @garden = Garden.find(contact_params[:garden_id])
    @garden_owner = User.find(@garden.user_id)
    @subject = contact_params[:subject]
    @message = contact_params[:message]
    mail(to: @garden_owner.email, subject: @subject)
  end

  private

  def contact_params
    params.require(:contact).permit(:current_user_id, :garden_id, :subject, :message)
  end

end
