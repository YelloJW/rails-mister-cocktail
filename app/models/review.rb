class Review < ApplicationRecord
  belongs_to :cocktail
  validates :name, presence: true
  validates :content, presence: true
  validates :rating, presence: true, inclusion: { in: [0, 1, 2, 3, 4, 5] }
end
