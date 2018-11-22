class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :coins, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :userroles
  has_many :roles, through: :userroles

  has_many :branchadmins
  has_many :branches, through: :branchadmins

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def admin?
    !roles.find_by_id(1).nil?
  end
  def director?
    !roles.find_by_id(2).nil?
  end
  def manager?
    !roles.find_by_id(3).nil?
  end
end
