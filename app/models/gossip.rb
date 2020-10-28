# frozen_string_literal: true

class Gossip < ApplicationRecord
  validates :title,
            length: { in: 3..14 }
  validates :content, :title,
            presence: true
  belongs_to :user
  has_many :tag_gossips
  has_many :tags, through: :tag_gossips
  has_many :comments
  has_many :likes
end
