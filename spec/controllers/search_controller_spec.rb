require 'rails_helper'

RSpec.describe SearchController, type: :controller do

  describe "GET #store" do
    it "returns http success" do
      get :store
      expect(response).to have_http_status(:success)
    end
  end

end