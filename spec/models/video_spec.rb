require 'rails_helper'

RSpec.describe Video, type: :model do

  it "is valid with name and url" do
    video = create(:video)
    expect(video).to be_valid
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:url) } 
  end
  
  describe "instance methods" do
    it "#quantity_views" do
      video = create(:video)
      expect(video.quantity_views).to eq("#{video.views}")
    end
  end
  
end
