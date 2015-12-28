class Phone < ActiveRecord::Base
belongs_to :user , foreign_key: 'user_id'
 PHONE_REGEX = /\A(\+\d{1,3}[- ]?)?\d{10}\Z/i
       validates :phone, :presence => true, :uniqueness => true, :length => { :in => 3..20 }, :format => PHONE_REGEX

end
