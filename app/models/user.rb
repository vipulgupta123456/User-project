class User < ActiveRecord::Base
	has_many :phones  , foreign_key: 'user_id'
	  attr_accessor :password
	   before_save :encrypt_password
      after_save :clear_password
      EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i
	  PHONE_REGEX = /\A(\+\d{1,3}[- ]?)?\d{10}\Z/i
	  validates :name    , :presence => true 
      validates :username, :presence => true, :uniqueness => true, :length => { :in => 3..20 }, :format => PHONE_REGEX
      validates :email, :presence => true, :format => EMAIL_REGEX
      validates :password, :confirmation => true #password_confirmation attr
	  
	  before_create { generate_token(:auth_token) }

def send_password_reset
  generate_token(:password_reset_token)
  self.password_reset_sent_at = Time.zone.now
  save!
  UserMailer.password_reset(self).deliver
end

def generate_token(column)
  begin
    self[column] = SecureRandom.urlsafe_base64
  end while User.exists?(column => self[column])
end
      
      validates_length_of :password, :in => 6..20, :on => :create
      
      def encrypt_password
      if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.encrypted_password= BCrypt::Engine.hash_secret(password, salt)
      end
     end
      def clear_password
      self.password = nil
 end

 def self.authenticate(username="", login_password="")
 
    user = User.find_by_username(username)
  
  if user && user.match_password(login_password)
    return user
  else
    return false
  end
end   
def match_password(login_password="")
  encrypted_password == BCrypt::Engine.hash_secret(login_password, salt)
end

end
