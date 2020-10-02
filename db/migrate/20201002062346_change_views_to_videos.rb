class ChangeViewsToVideos < ActiveRecord::Migration[6.0]
  def change
    change_column :videos, :views, :integer, :default => 0
  end
end
