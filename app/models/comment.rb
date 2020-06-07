class Comment < ApplicationRecord
  belongs_to :article

  validates :name, presence: true, length: { in: 3..50 }
  validates :body, presence: true, length: { minimum: 3 }
  validates :article_id, presence: true
end
