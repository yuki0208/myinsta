class AddPictureToPhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.string :picture
      t.text   :comment

      t.timestamps
    end
  end
end
