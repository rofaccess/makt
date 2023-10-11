require "rails_helper"

RSpec.describe "/home", type: :request do
  before do
    sign_in User.create(email: "user@email.com", password: "terere")
  end

  describe "GET /index" do
    it "renders a successful response" do
      get root_path
      expect(response).to be_successful
    end
  end
end
