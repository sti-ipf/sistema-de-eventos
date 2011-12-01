ActionMailer::Base.raise_delivery_errors = true
ActionMailer::Base.delivery_method = :smtp
# ActionMailer::Base.smtp_settings = {
#   :address              => "smtp.gmail.com",
#   :port                 => 587,
#   :domain               => 'gmail.com',
#   :user_name            => 'snoteapp@gmail.com',
#   :password             => 'notesmadeeasy',
#   :authentication       => 'plain',
#   :tls => true
# }
ActionMailer::Base.smtp_settings = {
  :address => 'mail.paulofreire.org',
  :domain  => 'paulofreire.org',
  :port      => 25,
  :user_name => 'eiesistema@paulofreire.org',
  :password => "12Freire"
}

ActionMailer::Base.default_url_options[:host] = 'inscricao.paulofreire.org'