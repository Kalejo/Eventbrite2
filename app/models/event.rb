class Event < ApplicationRecord
  belongs_to :user

    validates :description, presence: true 
    validates :place, presence: true
    validates :listing_name, presence: true, length: {maximum: 75} 
    validates :summary, presence: true, length: {maximum: 600}
    validates :email, presence: true
    validates :price, numericality: { only_integer: true, greater_than: 5 } 



end
