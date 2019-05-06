class CreateBusinesses < ActiveRecord::Migration[5.2]
  def change
    create_table :businesses do |t|
      t.references :category, foreign_key: true
      t.string :title
      t.string :budget
      t.integer :rating
      t.string :location
      t.string :calendar
      t.references :owner, index: true, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
