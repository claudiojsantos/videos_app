require 'rails_helper'

RSpec.describe "Videos", type: :request do

  describe "GET /" do
    it "returns http 200" do
      get "/"
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /new" do
    it "returns http 302 - not authorized" do
      video = create(:video)
      get "/videos/new", params: { id: video.id }
      expect(response).to have_http_status(302)
    end
  end

  # describe "GET /create" do
  #   it "returns http success" do
  #     post "/videos/create"
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "GET /edit" do
  #   it "returns http success" do
  #     get "/videos/edit"
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "GET /update" do
  #   it "returns http success" do
  #     get "/videos/update"
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "GET /delete" do
  #   it "returns http success" do
  #     get "/videos/delete"
  #     expect(response).to have_http_status(:success)
  #   end
  # end

end
