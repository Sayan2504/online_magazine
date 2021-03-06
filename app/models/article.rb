class Article < ApplicationRecord
  VALID_AUTHOR_NAME_REGEX = /\A[\sA-Za-z]*\z/i.freeze
  VALID_TITLE_REGEX = /\A[\s\w\d]*\z/i.freeze

  has_many :comments, as: :commentable
  belongs_to :user

  after_validation { self.author = self.author.squish }
  after_validation { self.title = self.title.squish }
  after_validation { self.body = self.body.squish }

  validates :author, presence: true, length: { maximum: 50, minimum: 2 }, format: { with: VALID_AUTHOR_NAME_REGEX }
  validates :title, presence: true, length: { maximum: 100, minimum: 2 }, format: { with: VALID_TITLE_REGEX }
  validates :body, presence: true, length: { minimum: 2 }
  validates :user_id, presence: true

  scope :article_author, ->(name) { where("author LIKE ?", "%#{name}%") }
  scope :article_title, ->(title) { where("title LIKE ?", "%#{title}%") }
end
