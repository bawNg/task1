class UserMailer < ActionMailer::Base
  def registration_confirmation(user)
    recipients  user.email
    from        "address@domain.com"
    subject     "Thank you for registering"
    body        :user => user
  end

  def contact_information(user)
    recipients  user.email
    from        "address@domain.com"
    subject     "Contact information for " + user.first_name
    body        :user => user
  end

end
