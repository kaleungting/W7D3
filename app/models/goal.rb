class Goal < ApplicationRecord

  validates :user_id, :target, :privacy, presence: true
  validates :privacy, inclusion: { in: ['private','public']}

  belongs_to :user,
  foreign_key: :user_id,
  class_name: :User

  
end