class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :avatar
      t.string :first_name
      t.string :second_name
      t.string :country

      t.timestamps null: false
    end
  end
end
