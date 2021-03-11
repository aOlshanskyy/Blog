class Post < ApplicationRecord
	belongs_to :user
	belongs_to :category
	has_many :comments, as: :object, dependent: :destroy
	has_rich_text :body
	validates :title, presence: true, length: { maximum: 100 }
	validates :body, presence: true
end
