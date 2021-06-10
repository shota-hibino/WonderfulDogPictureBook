class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :member_id
      t.integer :dog_breed_id

      t.timestamps
    end
  end
end
