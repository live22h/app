class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :coins,  dependent: :destroy
  has_many :orders,  dependent: :destroy
  has_many :roles
  has_many :roles, through: :userroles

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
