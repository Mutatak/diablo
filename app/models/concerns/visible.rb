# This module is used to define the status of articles and comments.
module Visible
  extend ActiveSupport::Concern

  # Available statuses for articles and comments.
  VALID_STATUSES = ['public', 'private', 'archived']

  included do
    validates :status, inclusion: { in: VALID_STATUSES }
  end

  class_methods do
    def public_count
      where(status: 'public').count
    end

    def private_count(current_user)
      current_user.articles.where(status: 'private').count
    end
  end

  def archived?
    status == 'archived'
  end

  def private?
    status == 'private'
  end

  def public?
    status == 'public'
  end
end
