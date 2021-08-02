class Post < ApplicationRecord
  belongs_to :user
  belongs_to :content
  has_many :tags, through: :post_tags
  has_many :post_tags
  has_many :post_like, dependent: :destroy
end
