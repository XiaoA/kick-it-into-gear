class User < ApplicationRecord
  has_many :tasks
  validates_presence_of :first_name, :username, :password, :password_confirmation, :email
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
