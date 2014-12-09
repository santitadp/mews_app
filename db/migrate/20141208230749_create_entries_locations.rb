class CreateEntriesLocations < ActiveRecord::Migration
  def change
    create_table :entries_locations do |t|
    	t.references :entry
    	t.references :location
    end
  end
end
