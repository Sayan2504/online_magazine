class Comment < ApplicationRecord
  VALID_COMMENTER_REGEX = /\A[\s\w]*\z/i.freeze

  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable

  after_validation { self.commenter = self.commenter.squish }
  after_validation { self.comment = self.comment.squish }

  validates :commenter, presence: true, length: { maximum: 100, minimum: 2 }, format: { with: VALID_COMMENTER_REGEX }
  validates :comment, presence: true, length: { minimum: 1 }
end
