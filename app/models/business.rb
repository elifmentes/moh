class Business < ApplicationRecord
  CATEGORIES = ['Bakers', 'Caligraphes', 'Caterers', 'Dress', 'Florists', 'Hair', 'Photographers', 'Venues']

  mount_uploader :photo, PhotoUploader

  belongs_to :owner, class_name: 'User'

  has_many :settlements
  has_many :users, through: :settlements

  validates :category, inclusion: { in: CATEGORIES }
  validates :owner_id, :title, :budget, :location, presence: true
end
