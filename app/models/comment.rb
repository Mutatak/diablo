class Comment < ApplicationRecord
  include Visible

  belongs_to :user
  belongs_to :article

  validates :commentor, presence: true
  validates :body, presence: true
end
