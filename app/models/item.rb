class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipfee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :estshipdate

  with_options presence: true do
    validates :name
    validates :description
    validates :price, format: { with: /\A[0-9]+\z/ }, numericality: { less_than_or_equal_to: 9999999, greater_than_or_equal_to: 300 }
    validates :image

    with_options numericality: { other_than: 1 }
      validates :category_id
      validates :status_id
      validates :shipfee_id
      validates :prefecture_id
      validates :estshipdate_id
    end
  end
end