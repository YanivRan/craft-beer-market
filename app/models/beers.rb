class Beer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

	validates :manufacturer_id, presence: true
	validates :name_id, presence: true
	validates :category_id, presence: true
	validates :country_id, presence: true
	validates :price, presence: true

end
