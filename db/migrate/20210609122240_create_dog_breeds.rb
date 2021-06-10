class CreateDogBreeds < ActiveRecord::Migration[5.2]
  def change
    create_table :dog_breeds do |t|
      t.integer :genre_id
      t.string :dog_image_id
      t.string :dog_name
      t.text :dog_introduction

      t.timestamps
    end
  end
end
