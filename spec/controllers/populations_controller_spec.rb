require 'rails_helper'

RSpec.describe PopulationsController, type: :controller do
  render_views

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, params: { year: "1900" }
      expect(response).to have_http_status(:success)
    end

    it "returns a population for a date" do
      year = 1900
      get :show, params: { year: year }
      expect(response.body).to match /Population: #{Population.get(year)}/im
    end

    it "responds to html request" do
      year = 1900
      get :show, params: { year: year }
      expect(response.content_type).to eq "text/html"
    end

    it "responds to xhr request" do
      year = 1900
      get :show, xhr: true, params: { year: year }
      expect(response.content_type).to eq "text/javascript"
    end

    it "logs the query request and response" do
      expect {
        get :show, xhr: true, params: { year: "1900" }
      }.to change{QueryLog.count}.by(1)
    end

    context "when an error occurs within the controller" do
      it "captures the error and logs the query request and error response" do
       allow(Population).to receive(:get).and_raise StandardError

       get :show, xhr: true, params: { year: "1900" }

       log = QueryLog.first

       expect(log.query).to eq "1900"
       expect(log.response).to eq "StandardError"
      end
    end
  end
end
