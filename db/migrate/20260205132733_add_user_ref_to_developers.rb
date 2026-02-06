class AddUserRefToDevelopers < ActiveRecord::Migration[8.1]
  def change
    add_reference :developers, :user, null: false, foreign_key: true, index: { unique: true }
  end
end
