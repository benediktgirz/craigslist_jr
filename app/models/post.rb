class Post < ActiveRecord::Base
  has_many :associations
  has_many :categories, :through => :associations
  validates :title, :text, :location, presence: true
end