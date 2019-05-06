class Business < ApplicationRecord

  mount_uploader :photo, PhotoUploader

  belongs_to :owner, class_name: 'User'
  belongs_to :category

  has_many :settlements
  has_many :users, through: :settlements

  validates :owner_id, :title, :budget, :location, :category, presence: true
end
