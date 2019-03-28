class CreateBusinesses < ActiveRecord::Migration[5.2]
  def change
    create_table :businesses do |t|
      t.string :title
      t.string :budget
      t.integer :rating
      t.string :location
      t.string :calendar

      t.timestamps
    end
  end
end
