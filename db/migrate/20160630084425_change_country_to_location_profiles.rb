class ChangeCountryToLocationProfiles < ActiveRecord::Migration[5.0]
  def change
    rename_column :profiles, :country, :location
  end
end
