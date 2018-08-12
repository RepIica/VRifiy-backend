class User < ApplicationRecord
  has_secure_password
  has_many :projects

  validates_presence_of :name, :password
end
