class UserMailer < ActionMailer::Base
  #default :from => "alerts@stormsavvy.com"
  default :from => "doolin@inventiumsystems.com"
  #default :from => "david.doolin@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.alert_mailer.pop.subject
  #
  def pop
    @greeting = "Hi"
    mail to: "david.doolin@gmail.com", :subject => 'booyah'
  end

  def pop_alert(user)
    @greeting = "Here daily weather alerts for each of your sites: "
    mail(:to => user.email, :subject => "Daily weather alerts")
  end

  def pester_admins(email)
    @greeting = "Yo yo yo!"
    mail(:to => email, :subject => 'Storm Savvy is working great today!')
  end

  def mailout(to = nil)
    @users = User.all
    @users.each do |user|
      @user = user # `@user` is needed for the template
      if user.has_site?
        mail(:to => user.email, :subject => "Project estimate").deliver
      end
    end
  end

end
