# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :gossip
  belongs_to :user
  has_many :likes
end
