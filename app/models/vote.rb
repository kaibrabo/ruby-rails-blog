class Vote < ApplicationRecord
  belongs_to :post
  belongs_to :user
  after_save :update_post

  validates :value, inclusion: { in: [-1, 1], message: "%{value} is not a valid vote." }, presence: true

  private
  
  def update_post
    post.update_rank
  end
end
