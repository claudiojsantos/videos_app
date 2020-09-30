class Video < ApplicationRecord
    validates :name, :url, presence: :true
    validates_numericality_of :views, greater_than_or_equal_to: 0

    mount_uploader :url, VideoUploader

    belongs_to :user

    def quantity_views
        "#{views}"
    end
end
