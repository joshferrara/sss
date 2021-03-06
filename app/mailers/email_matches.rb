class EmailMatches < ActionMailer::Base
  default from: ENV['EMAIL_USER']

  # invite all users
  def invite_email(user)
    @user = user
    @url  = "http://sssanta.com"
    mail(:to => user.email, :subject => "A Christmas offer you can't refuse.")
  end

  def remind_email(user)
    @user = user
    @url  = "http://sssanta.com"
    mail(:to => user.email, :subject => "Reminder: A Christmas offer you can't refuse.")
  end

  # confirm a user's rsvp
  def accepted_invite(user)
    @user = user
    mail(:to => user.email, :subject => "Welcome to the Secret Santa Society.")
  end

  # send out matches to rsvp'd users
  def send_matches(user)
    @user = user
    mail(:to => user.email, :subject => "Your Secret Santa Society match is ready.")
  end

end
