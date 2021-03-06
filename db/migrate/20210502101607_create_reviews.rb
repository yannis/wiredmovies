class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.belongs_to :movie, null: false, foreign_key: true
      t.text :title, null: false
      t.text :body, null: false
      t.text :author, null: false

      t.timestamps
    end
  end
end
