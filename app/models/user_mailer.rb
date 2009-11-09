class UserMailer < ActionMailer::Base
  def registration_confirmation(user)
    recipients  user.email_address
    from        "address@domain.com"
    subject     "Thank you for registering"
    body        :user => user
  end

  def contact_information(recipient, sender, message)
    recipients  recipient.email_address
    from        "address@domain.com"
    subject     "Contact information for #{sender.first_name} #{sender.last_name}"
    body        :recipient => recipient, :sender => sender, :message => message
  end

end
