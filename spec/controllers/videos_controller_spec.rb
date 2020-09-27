require "rails_helper"

RSpec.describe VideosController, type: :controller do
    describe "as a guest" do
        context "#index" do
            it "responds a successfully" do
                get :index
                expect(response).to have_http_status(:success)
            end

            it "responds a code 200" do
                get :index
                expect(response).to have_http_status(200) 
            end
        end

        context "#show" do
            it "show response 302 - not authorized" do
                video = create(:video)
                get :show, params: { id: video.id }
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
        
        context "#show" do 
            it "show response 200 - authorized" do
                get :show, params: { id: @video.id }
                expect(response).to have_http_status(200)
            end
            
            it "render :show template" do
                get :show, params: { id: @video.id }
                expect(response).to render_template(:show)
            end
        end
    end
end
