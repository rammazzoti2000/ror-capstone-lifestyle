class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :article

  validates :user_id, :article_id, presence: true
end
