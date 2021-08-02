class Content < ApplicationRecord
  has_many :posts, dependent: :destroy
end
