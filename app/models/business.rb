class Business < ApplicationRecord

  mount_uploader :photo, PhotoUploader

  belongs_to :owner, class_name: 'User'

  has_many :settlements
  has_many :users, through: :settlements

  validates :owner_id, :title, :budget, :location, presence: true
end
