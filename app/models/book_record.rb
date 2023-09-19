class BookRecord < ApplicationRecord

  validates :title, presence: true
  validates :content, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :book_id, presence: true, uniqueness: true
end
