class Developer < ApplicationRecord
  belongs_to :user
  validates :hero, presence: true

  has_one_attached :avatar
end
