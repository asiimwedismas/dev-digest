class Article < ApplicationRecord
  validates :title, presence: true, length: { maximum: 1000,
                                              too_long: '256 maximum allowed characters in an article title.' }

  validates :text, presence: true
  validates :image, presence: true

  belongs_to :author, foreign_key: 'author_id', class_name: 'User'
  has_many :article_categories
  has_many :categories, through: :article_categories, dependent: :destroy

  has_many :votes, dependent: :destroy
end
