class UserMailer < ActionMailer::Base

  default :from => "alerts@stormsavvy.com"

  def pester_admins(email)
    @numusers = User.count
    @numprojects = Project.count
    @numsites = Site.count

    @greeting = "Greetings"
    @forecast2 = NOAAForecast.new(94605)
    @forecast1 = @forecast2.get_forecast_array
=begin
    @forecast1 = [{ :date => Date.today, :weather => "90" },
                  { :date => Date.today + 1.day, :weather => "85"},
                  { :date => Date.today + 2.day, :weather => "80"},
                  { :date => Date.today + 3.day, :weather => "75"},
                  { :date => Date.today + 4.day, :weather => "70"},
                  { :date => Date.today + 5.day, :weather => "65"},
                  { :date => Date.today + 6.day, :weather => "60"}]
=end
    mail(
      :from     => "alerts@stormsavvy.com",
      :to       => email,
      :subject  => "Storm Savvy POP Alert"
      ).deliver
  end

  def mailout(to = nil)
    @greeting = "Greetings"
    @users = User.all

    @users.each do |user|
      @user = user # `@user` is needed for the template

      if @user.has_site?
        mail(
          :from     => "alerts@stormsavvy.com",
          :to       => @user.email,
          :subject  => "Storm Savvy Project Status Notification"
          ).deliver
      end
    end
  end

end
