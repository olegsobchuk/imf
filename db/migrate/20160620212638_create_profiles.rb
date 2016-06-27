class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.references :user, index: true
      t.string :first_name
      t.string :last_name
      t.string :country
      t.string :avatar_id

      t.timestamps null: false
    end
  end
end
