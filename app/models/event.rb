class Event < ApplicationRecord
  belongs_to :user

    validates :description, presence: true 
    validates :place, presence: true
    validates :price, numericality: { only_integer: true, greater_than: 5 } 



end
