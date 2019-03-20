# Preview all emails at http://localhost:3000/rails/mailers/user_contact
class UserContactPreview < ActionMailer::Preview

  def user_contact
    UserContactMailer.contact_garden(6, 9, "trop beau", "je kiffe")
  end

end
