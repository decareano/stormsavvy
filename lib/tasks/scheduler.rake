
desc "This task is called by the Heroku scheduler add-on"

task :dailynotice => :environment do
  admins = ['david.doolin+stormsavvy@gmail.com',
            'kharma@gmail.com',
            'paul.maki@gmail.com']
  admins.each do |address|
    UserMailer.pester_admins(address).deliver
  end
end

task :noaaforecast => :environment do
	test_users = ['kharma+storm@gmail.com', 
                'david.doolin+storm@gmail.com']
  test_users.each do |address|
	  UserMailer.noaa_forecast(address).deliver
	end
end

task :umtest => :environment do
  UserMailer.umtest
end

# task :stormpopnotice => :environment do
# 	test_users = ['kharma+storm@gmail.com', 
#               'david.doolin+storm@gmail.com']
#     if user.sites.precipitation_state(forecast) == :imminent then
#       test_users.each do |address|
# 	  UserMailer.pop_alert(address).deliver
# 	end
#end