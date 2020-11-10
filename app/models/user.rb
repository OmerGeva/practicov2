class User < ApplicationRecord
  has_secure_password

  has_many :practices
  has_many :challenges

end
