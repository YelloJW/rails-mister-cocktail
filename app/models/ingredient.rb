class Ingredient < ApplicationRecord
  has_many :doses
  validates :name, presence: true, uniqueness: true
  before_destroy :check_doses

  def check_doses
    doses.count == 0
  end
 end
