class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy

  validates :name, :address, :phone_number, presence: true
  validates_associated :reviews

  categories = %w[Chinese Italian Japanese French Belgian].freeze
  validates :category, inclusion: { in: categories }
end
