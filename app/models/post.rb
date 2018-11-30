class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy

  validates :body, :title, presence: true
end
