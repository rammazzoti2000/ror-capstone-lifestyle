class Article < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :category
  has_many :comments, foreign_key: 'article_id', dependent: :destroy

  mount_uploader :featured_image, FeaturedImageUploader

  validates :title, presence: true, length: { in: 3..50 }
  validates :text, presence: true, length: { minimum: 50 }
  validates :featured_image, presence: true
  validates :author_id, presence: true
  validates :category_id, presence: true

  scope :category_first_article, ->(category_id) { where('category_id = ? ',
                                                         category_id).last }
  scope :category_all_article, ->(category_id) { where('category_id = ? ',
                                                        category_id) }
  scope :featured, -> { Vote.group(:article_id).count.keys.first }
  scope :featured_article, -> { Article.find_by(id: featured) }

  def art
    featured_article
  end
end
