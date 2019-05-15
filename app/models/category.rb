class Category < ApplicationRecord
  has_many :businesses

  validates :name, presence: true, inclusion: { in: %w[Bakers Caligraphes Caterers Dress Florists Hair Photographers Venues] }
  validates :name, uniqueness: true
end
