class Video < ApplicationRecord
    validates :name, presence: :true
    validates_numericality_of :views, greater_than_or_equal_to: 0

    after_create :update_folder
    after_commit :create_m3u8

    mount_uploader :file, VideoUploader

    belongs_to :user

    def quantity_views
        "#{views}"
    end

    def update_folder
        @video = Video.find_by(id: id)

        filename = File.basename("uploads/video/file/#{@video.id}#{@video.file}", ".*")


        @video.url = "/uploads/video/file/#{@video.id}/#{filename}.m3u8"

        @video.update({"url" => @video.url})
    end

    def create_m3u8
        unless self.new_record? and self.delete
            file = "#{Rails.root}/public#{@video.file}"
            filename = File.basename("uploads/video/file/#{@video.id}#{@video.file}", ".*")
            filename = "#{Rails.root}/public/uploads/video/file/#{@video.id}/#{filename}"

            system "ffmpeg -i #{file} -b:v 1M -g 60 -hls_time 2 -hls_list_size 0 -hls_segment_size 500000 #{filename}.m3u8"
        end
    end
end
