class User < ApplicationRecord
  rolify
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  after_create :assign_default_role
  
  def assign_default_role
    self.add_role(:user) if roles.blank?
  end
end
