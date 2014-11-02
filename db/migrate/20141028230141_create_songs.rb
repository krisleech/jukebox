class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string  :title, null: false
      t.string  :url
      t.integer :votes, default: 0, null: false

      t.timestamps null: false
    end
  end
end
