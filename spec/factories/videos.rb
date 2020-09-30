FactoryBot.define do
  factory :video do
    file_path = Rails.root.join('spec', 'support', 'assets', 'playlist.m3u8')
    name { Faker::Name.name }
    url { fixture_file_upload(file_path, 'video/m3u8') }
    user { FactoryBot.create(:user) }
    views { 0 }
  end
end
