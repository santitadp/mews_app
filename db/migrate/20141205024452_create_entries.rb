class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.text :title
      t.text :summary
      t.text :url

      t.timestamps
    end
  end
end
