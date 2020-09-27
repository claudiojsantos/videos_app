class Video < ApplicationRecord
    validates :name, :url, presence: :true

    def quantity_views
        "#{views}"
    end
end
