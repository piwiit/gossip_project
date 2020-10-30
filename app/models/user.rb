# frozen_string_literal: true

class User < ApplicationRecord
  # validates :email,
  # uniqueness: true
  # validates :email,:description,
  # presence: true
  # validates :description,
  # length: { maximum: 140 }
  has_secure_password
  validates :password,
            presence: true
  belongs_to :city
  has_many :gossips
  has_many :sent_messages, foreign_key: 'sender_id', class_name: 'PrivateMessage'
  has_many :pm_users
  has_many :received_messages, through: :pm_users, class_name: 'PrivateMessage'
  has_many :comments
  has_many :likes
  def remember(remember_token)
    remember_digest = BCrypt::Password.create(remember_token)
    update(remember_digest: remember_digest)
  end
end
