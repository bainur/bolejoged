class User < ApplicationRecord
  rolify
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :lockable

  validates :full_name, presence: true

  has_one                         :user_information, dependent: :destroy
  accepts_nested_attributes_for   :user_information

  after_create :assign_default_role

  def assign_default_role
    self.add_role(:user) if self.roles.blank?
  end
end
