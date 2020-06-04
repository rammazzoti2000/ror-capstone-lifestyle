class Article < ApplicationRecord
  before_save :capitalize_title

  belongs_to :author, class_name: 'User'

  belongs_to :category

  has_many :comments, foreign_key: 'article_id', dependent: :destroy

  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  has_many :votes, foreign_key: 'article_id', dependent: :destroy
  has_many :voters, through: :votes, source: :user

  has_many :bookmarks, foreign_key: 'article_id', dependent: :destroy
  has_many :bookmarked_readers, through: :bookmarks, source: :user

  mount_uploader :featured_image, FeaturedImageUploader

  validates :title, presence: true, length: { in: 3..50 }
  validates :text, presence: true, length: { minimum: 20 }
  validates :featured_image, :author_id, :category_id, presence: true

  scope :all_published_articles, -> { includes(:category).where('status = ? ', 'published') }
  scope :articles_per_category, ->(category_id) { includes(:author).where('category_id = ? and status = ?', category_id, 'published') }
  scope :category_all_article, -> { Category.includes(:articles).where(articles: { status: "published" }).order(priority: :desc) }
  scope :featured_article, -> { self.all_published_articles.joins(:votes).group(:id).count.sort_by{|k, v| v}.last }
  scope :most_popular_articles, ->  { where(id: self.all_published_articles.joins(:votes).group(:id).count.sort_by{|k, v| v}.last(4).map {|a, b| a}) }
  scope :user_pub_articles, ->(current_user) { where('author_id = ? and status = ?', current_user, 'published') }
  scope :user_save_articles, ->(current_user) { where('author_id = ? and status = ?', current_user, 'saved') }
  scope :user_bookmarks, ->(current_user) { includes(:author).joins(:bookmarks).where('user_id = ? ', current_user) }
  scope :suggested_article, ->(tag, category_id) { self.all_published_articles.joins(:taggings).where('tag_id = ? or category_id = ? ', tag, category_id) }

  default_scope -> { order(created_at: :desc) }

  def tag_list
    self.tags.collect do |tag|
      tag.name
    end.join(',')
  end

  def tag_list=(tags_string)
    tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
    new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name) }
    self.tags = new_or_found_tags

  end

  def self.all_suggested_article(category_id, article)
    suggested_art_arr = []
    article.tags.each do |tag|
      suggested_art_arr << Article.suggested_article(tag, category_id)
    end
    suggested_art_arr.flatten.uniq - [article]
  end

  def self.search_article(search)
    split_search = search.downcase.split(" ")
    arr = []
    self.all_published_articles.unscope(:includes).each do |article|
      split_search.map { |word| arr << article if article.title.downcase.split(' ').include?(word) }
    end
    arr.uniq
  end

  private

    def capitalize_title
      self.title = title.capitalize
    end
end
