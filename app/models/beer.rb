class Beer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
    has_many :beer_categories
    has_many :beer_manufacturers
    has_many :countries
	validates :manufacturer_id, presence: true
	validates :name_id, presence: true
	validates :category_id, presence: true
	validates :country_id, presence: true
	validates :price, presence: true

end
