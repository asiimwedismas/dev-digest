class Article < ApplicationRecord
  belongs_to :author, foreign_key: 'author_id', class_name: 'User'
  has_many :article_categories
  has_many :categories, through: :article_categories, dependent: :destroy

  has_many :votes, dependent: :destroy

  has_attached_file :image
  validates_attachment_content_type :image, content_type: ['image/jpg', 'image/jpeg', 'image/png']
end
