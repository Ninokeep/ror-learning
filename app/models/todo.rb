class Todo < ApplicationRecord

  validates :message, presence: true, length: {minimum:10}
  validates :done, presence: true
end
