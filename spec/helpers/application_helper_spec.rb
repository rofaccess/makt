require "rails_helper"

RSpec.describe ApplicationHelper, type: :helper do
  describe ".logo_color" do
    it "return logo color" do
      expect(logo_color).to eq("lilac")
    end
  end

  describe ".logo_name" do
    it "return logo name" do
      expect(logo_name).to eq("logo_lilac.png")
    end
  end

  describe ".favicon_logo_name" do
    it "return favicon logo name" do
      expect(favicon_logo_name).to eq("favicon_logo_lilac.ico")
    end
  end

  describe ".favicon_logo_tag" do
    it "return favicon logo tag" do
      expect(favicon_logo_tag).to eq("<link rel='icon' type='image/x-icon' href='/images/favicon_logo_lilac.ico'>")
    end
  end

  describe ".logo_tag" do
    it "return logo tag" do
      expect(logo_tag).to eq("<a href='/' data-turbo='false'><img src='/images/logo_lilac.png' alt='MaKT'></a>")
    end
  end

  describe ".new_devise_session_text" do
    it "return text for registrations controller" do
      allow(controller).to receive(:controller_name).and_return("registrations")
      # Use stub to avoid this RuntimeError: Cannot use t(".already_have_an_account") shortcut because path is not available
      allow(helper).to receive(:t).with(".already_have_an_account").and_return(I18n.t("devise.shared.links.already_have_an_account"))

      # Is necessary to use helper.new_devise_session_text to work previous line
      expect(helper.new_devise_session_text).to eq(I18n.t("devise.shared.links.already_have_an_account"))
    end

    it "return text for passwords controller" do
      allow(controller).to receive(:controller_name).and_return("passwords")
      allow(helper).to receive(:t).with(".remember_your_account").and_return(I18n.t("devise.shared.links.remember_your_account"))

      expect(helper.new_devise_session_text).to eq(I18n.t("devise.shared.links.remember_your_account"))
    end
  end

  describe ".active_path?" do
    it "return true when request path include in paths" do
      helper.request.path = "/product_brands"
      expect(active_path?(stock_settings_paths)).to eq(true)
    end

    it "return false when request path not include in paths" do
      helper.request.path = "/"
      expect(active_path?(stock_settings_paths)).to eq(false)
    end
  end

  describe ".stock_settings_paths" do
    it "return stock settings paths" do
      expect(stock_settings_paths).to eq(["/product_brands"])
    end
  end
end
