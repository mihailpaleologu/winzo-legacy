ActionMailer::Base.smtp_settings = {
  :address => "smtp.mandrillapp.com",
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true,
  :user_name => "me@andreipopovici.net",
  :password => "F6KQ7NzolJNqsiEuiTIT2A"
}
