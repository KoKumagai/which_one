class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :survey

  validates :content, presence: true
end
