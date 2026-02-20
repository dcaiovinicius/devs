class Developer < ApplicationRecord
  belongs_to :user
  validates :hero, presence: true

  has_one_attached :avatar

  after_create :notify_admins

  private

  def notify_admins
    User.admins.each do |user|
      AdminMailer.with(user: user).new_developer.deliver_later
    end
  end
end
