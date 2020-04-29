require 'rails_helper'

RSpec.describe QueryLogsController, type: :controller do
  render_views

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "responds to html request" do
      get :index
      expect(response.content_type).to eq "text/html"
    end
  end
end
