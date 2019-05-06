class Category < ApplicationRecord
  has_many :businesses

  validates :name, presence: true, inclusion: { in: %w[Bakers Calligraphes Caterers Dress Florists Hair Photographers Venues] }
end
