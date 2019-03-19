class Contact < MailForm::Base

  attribute :sender_name,      :validate => true
  attribute :sender_email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :recipient
  attribute :subject
  attribute :message
  attribute :nickname,  :captcha  => true
  attribute :garden
  attribute :user

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      subject: "Un utilisateur de monpotager.com vous a envoyé un message",
      message: message,
      to: recipient,
      from: %("#{sender_name}" <#{sender_email}>)
    }
  end
end