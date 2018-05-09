class Event < ApplicationRecord
	belongs_to :user
	has_many :photos


    validates :description, presence: true
    validates :place, presence: true
    validates :price, numericality: { only_integer: true, greater_than: 5 }

end
