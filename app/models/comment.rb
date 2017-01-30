class Comment < ApplicationRecord
  belongs_to :my_thread

  validates :user_id, presence: true
  validates :message, presence: true, length:{in: 1..1000}
  validates :my_thread_id, presence: true
end
