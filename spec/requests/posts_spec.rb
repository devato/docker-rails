require 'rails_helper'

RSpec.describe "Posts", type: :request do

  before do
    allow(ApiService).to receive(:get_posts).and_return({})
    allow(ApiService).to receive(:show_post).and_return({})
  end

  describe "GET /posts" do
    it "works! (now write some real specs)" do
      get posts_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /posts/:id" do
    it "works! (now write some real specs)" do
      get post_path(1)
      expect(response).to have_http_status(200)
    end
  end
end
