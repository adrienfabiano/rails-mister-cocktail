class Ingredient < ApplicationRecord
  has_many :doses
  has_many :cocktails, through: :doses

  validates :name, presence: true, uniqueness: true

  def to_s
    "#{name}"
  end
end
