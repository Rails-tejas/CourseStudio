class AddDetailsToProfiles < ActiveRecord::Migration[8.0]
  def change
    add_column :profiles, :name, :string
    add_column :profiles, :gender, :string
    add_column :profiles, :bio, :text
    add_column :profiles, :github_url, :string
    add_column :profiles, :linkedin_url, :string
    add_column :profiles, :favorite_languages, :text
    add_column :profiles, :domains, :text
  end
end
