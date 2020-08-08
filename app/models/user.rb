class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :registerable, :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # :registerable, :recoverable,
  devise :database_authenticatable, :rememberable, :validatable
end
