class Vote < ApplicationRecord
  validates :user_id, uniqueness: { scope: :article_id }
  belongs_to :user
  belongs_to :article

  scope :vote_count, -> { group(:article_id).count }
end
