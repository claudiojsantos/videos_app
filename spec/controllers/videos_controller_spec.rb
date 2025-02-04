require "rails_helper"

RSpec.describe VideosController, type: :controller do
  describe "as a guest" do
    context "#show" do
      it "show response 302 - not authorized" do
        video = create(:video)
        get :show, params: {id: video.id}
        expect(response).to have_http_status(302)
      end
    end
  end

  describe "as a logged user" do
    before do
      @user = create(:user)
      @video = create(:video)
      sign_in @user
    end

    context "#index" do
      it "responds a successfully" do
        get :index
        expect(response).to have_http_status(:success)
      end

      it "responds a code 200" do
        get :index
        expect(response).to have_http_status(200)
      end

      it "render :index template" do
        get :index, params: {user_id: subject.current_user.id}
        expect(response).to render_template(:index)
      end
    end

    context "#show" do
      it "show response 200 - authorized" do
        get :show, params: {id: @video.id }
        expect(response).to have_http_status(200)
      end

      it "render :show template" do
        get :show, params: {id: @video.id}
        expect(response).to render_template(:show)
      end
    end

    context '#create' do
      before do
        @video_params = attributes_for(:video)
      end

      it "with valid attributes" do
        expect { post :create, params: {video: @video_params} }.to change(Video, :count).by(1)
      end


    end
  end
end
