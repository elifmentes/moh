class Business < ApplicationRecord

  geocoded_by :location

  mount_uploader :photo, PhotoUploader

  belongs_to :owner, class_name: 'User'
  belongs_to :category

  has_many :settlements
  has_many :users, through: :settlements

  validates :owner_id, :title, :budget, :location, :category, presence: true
  after_validation :geocode, if: :will_save_change_to_location?
end
