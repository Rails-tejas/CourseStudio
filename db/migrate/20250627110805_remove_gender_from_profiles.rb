class RemoveGenderFromProfiles < ActiveRecord::Migration[8.0]
  def change
    remove_column :profiles, :gender, :string
  end
end
