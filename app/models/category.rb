class Category < ActiveRecord::Base
  has_many :associations
  has_many :posts, :through => :associations
  validates :title, presence: true
end