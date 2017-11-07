class CreatePhotoposts < ActiveRecord::Migration[5.1]
  def change
    create_table :photoposts do |t|
      t.string :picture
      t.text :comment
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :photoposts, [:user_id, :created_at]
  end
end
