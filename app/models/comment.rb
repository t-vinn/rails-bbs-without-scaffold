class Comment < ApplicationRecord
  belongs_to :my_thread
  belongs_to :user

  validates :user_id, presence: true
  validates :message, presence: true, length:{in: 2..1000}
  validates :my_thread_id, presence: true
end
