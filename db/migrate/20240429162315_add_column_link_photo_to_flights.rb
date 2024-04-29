class AddColumnLinkPhotoToFlights < ActiveRecord::Migration[7.0]
  def change
    add_column :flights, :photo_link, :text
  end
end
