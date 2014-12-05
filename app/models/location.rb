class Location < ActiveRecord::Base
	
	belongs_to :entry

	validates :city, :state, :country, presence: true

end