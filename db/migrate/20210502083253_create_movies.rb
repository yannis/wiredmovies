class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.text :name, null: false
      t.text :director, null: false
      t.date :released_on, null: false
      t.text :image_url, null: false
      t.text :description, null: false

      t.timestamps
    end
    add_index :movies, :name
  end
end
