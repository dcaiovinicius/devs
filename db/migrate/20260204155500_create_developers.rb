class CreateDevelopers < ActiveRecord::Migration[8.1]
  def change
    create_table :developers do |t|
      t.date :available_on, null: false
      t.text :hero, null: false
      t.text :bio, null: false
      t.string :website
      t.string :github
      t.string :twitter

      t.timestamps
    end
  end
end
