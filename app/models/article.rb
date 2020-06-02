class Article < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :category
  mount_uploader :featured_image, FeaturedImageUploader

  validates :title, presence: true, length: { in: 3..50 }
  validates :text, presence: true, length: { minimum: 50 }
  validates :featured_image, presence: true
  validates :author_id, presence: true
  validates :category_id, presence: true

  scope :category_first_article, ->(category_id) { where('category_id = ? ', category_id).last }
end
