class AddFileToVideos < ActiveRecord::Migration[6.0]
  def change
    add_column :videos, :file, :string
  end
end
