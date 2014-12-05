class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :title
      t.string :summary
      t.string :url

      t.timestamps
    end
  end
end
