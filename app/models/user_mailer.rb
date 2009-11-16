class UserMailer < ActionMailer::Base
  def registration_confirmation(user, password)
    recipients  user.email_address
    from        "test@task1.defirence.za.net"
    subject     "Thank you for registering"
    body        :user => user, :password => password
    content_type "text/html"
  end

  def contact_information(recipient, sender, message)
    recipients  recipient.email_address
    from        "test@task1.defirence.za.net"
    subject     "Contact information for #{sender.first_name} #{sender.last_name}"
    body        :recipient => recipient, :sender => sender, :message => message
    content_type "text/html"
    
  end

end
