ActionMailer::Base.smtp_settings = {
         :address                      => "192.168.10.4",
         :port                            => 587,
         :domain                      => "webnish-main",
         :user_name                => "vipul@webnish.com",
         :password                  => "vipul123",
         :authentication           => "plain",
         :enable_starttls_auto  => false
         }

 ActionMailer::Base.default_url_options[:host] = "localhost:3000"
