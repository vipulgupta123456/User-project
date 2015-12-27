ActionMailer::Base.smtp_settings = {
         :address                      => "smtp.gmail.com",
         :port                            => 587,
         :domain                      => "smtp.gmail.com",
         :user_name                => "vipulfke123@gmail.com",
         :password                  => "vipul123",
         :authentication           => "plain",
         #:enable_starttls_auto  => true
         }

 ActionMailer::Base.default_url_options[:host] = "localhost:3000"
