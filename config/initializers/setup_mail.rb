ActionMailer::Base.smtp_settings = {
         :address                      => "smtp.gmail.com",
         :port                            => 587,
         :domain                      => "smtp.gmail.com",
         :user_name                => "infyvipul13@gmail.com",
         :password                  => "nittrichy",
         :authentication           => "plain",
         #:enable_starttls_auto  => true
         }

 ActionMailer::Base.default_url_options[:host] = "localhost:3000"
