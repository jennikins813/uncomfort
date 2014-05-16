class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :photo
      t.text :bio
      t.string :website
      t.integer :user_id

      t.timestamps
    end
  end
end
