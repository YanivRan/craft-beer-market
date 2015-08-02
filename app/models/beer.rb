class Beer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
    has_one :beer_category
    has_one :beer_manufacturer
    has_one :country
	validates :manufacturer_id, presence: true
	validates :name, presence: true
	validates :category_id, presence: true
	validates :country_id, presence: true
	validates :price, presence: true

	scope :archived, -> (archived) { where archived: archived }

end
