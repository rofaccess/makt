require "rails_helper"

RSpec.describe "/home", type: :request do
  include_context :login_user

  describe "GET /index" do
    it "renders a successful response" do
      get root_path
      expect(response).to be_successful
    end
  end
end
