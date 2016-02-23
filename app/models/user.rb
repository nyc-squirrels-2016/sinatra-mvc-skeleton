class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :comments

  validates :username, presence: true, uniqueness: true

  has_secure_password
end
