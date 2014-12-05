class Entry < ActiveRecord::Base

	has_many :locations

	validates :title, :url, presence: true

end