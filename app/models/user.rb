class User < ActiveRecord::Base
  #make the email lower case to ensure there is no duplication
  before_save {self.email = email.downcase }
  #Email Validation. Makes sure name and email is inputed and the max length is specified.
  validates(:name, presence: true, length: {maximum: 50})
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255},
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: {case_sensitive: false}

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end
