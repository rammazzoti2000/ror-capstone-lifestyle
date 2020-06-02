class User < ApplicationRecord
  attr_accessor :remember_token

  has_many :articles, foreign_key: 'author_id', dependent: :destroy

  has_many :votes, foreign_key: 'user_id', dependent: :destroy
  has_many :voted_articles, through: :votes, source: :article

  has_many :bookmarks, foreign_key: 'user_id', dependent: :destroy
  has_many :bookmarked_articles, through: :bookmarks, source: :article

  validates :name,  presence: true, length: { maximum: 50 }
  validates :username, presence: true, length: { maximum: 50 },
                       uniqueness: { case_sensitive: false }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }

  before_save :downcase_email
  has_secure_password


  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # Returns true if the given token matches the digest.
  def authenticated?(remember_token)
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget_digest_db
    update_attribute(:remember_digest, nil)
  end

  def vote(article)
    voted_articles << article
  end

  def unvote(article)
    voted_articles.delete(article)
  end

  def voted?(article)
    voted_articles.include?(article)
  end

  def bookmark(article)
    bookmarked_articles << article
  end

  def unbookmark(article)
    bookmarked_articles.delete(article)
  end

  def bookmarked?(article)
    bookmarked_articles.include?(article)
  end

  private

    def downcase_email
      self.email = email.downcase
      self.username = username.downcase
    end
end
