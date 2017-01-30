class MyThread < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :title, presence: true, uniqueness: true, length: {in: 3..100 }
  validates :user_id, presence: true
end
