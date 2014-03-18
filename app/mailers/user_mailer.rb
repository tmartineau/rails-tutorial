class UserMailer < ActionMailer::Base
  default from: "ttmartineau@gmail.com"

  def contact_confirmation(email, first_name, last_name, message)
    @email = email
    @first_name = first_name
    @last_name = last_name
    @message = message

    mail(:to => email, :subject => 'Thank you for contacting us!')
  end
end
