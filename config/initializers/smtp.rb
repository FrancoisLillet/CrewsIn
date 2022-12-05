ActionMailer::Base.smtp_settings = {
  address: "smtp.gmail.com",
  port: 587,
  domain: 'gmail.com',
  user_name: "crewsin.contact@gmail.com",
  password: "crewsinboys",
  authentication: :login,
  enable_starttls_auto: true
}
