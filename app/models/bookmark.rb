class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list
  validates :list_id, presence: true
  validates :movie_id, presence: true
  validates :movie_id, uniqueness: { scope: :list_id, message: "This movie is already in this list" }
  validates :comment, length: { minimum: 6 }
end
