class ContactsController < ApplicationController
  def new
    puts "#" * 20
    puts params

    @contact = Contact.new(params)
    @garden = Garden.find(params[:garden])
    @from_user = User.find(params[:user])

  end

  def create
    @sender = User.find(contact_params[:user])
    @garden = Garden.find(contact_params[:garden])
    @recipient = User.find(@garden.user_id).email
    @subject = contact_params[:subject]
    @message = contact_params[:message]
    @contact = Contact.new(
      recipient: @recipient,
      sender_name: @sender.first_name,
      sender_email: @sender.email,
      subject: @subject,
      message: @message
      )
    @contact.request = request
    if @contact.deliver
      flash.now[:notice] = 'Thank you for your message. We will contact you soon!'
    else
      flash.now[:error] = 'Cannot send message.'
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:subject, :message, :garden, :sender, :user, :captcha)
  end

end