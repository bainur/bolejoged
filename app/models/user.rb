class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :lockable

  validates :full_name, presence: true

  has_one                         :user_information, dependent: :destroy
  accepts_nested_attributes_for   :user_information
end
