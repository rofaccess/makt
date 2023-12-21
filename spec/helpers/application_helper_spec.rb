require "rails_helper"

RSpec.describe ApplicationHelper, type: :helper do
  describe ".favicon_logo_tag" do
    it "return favicon logo tag" do
      expect(favicon_logo_tag).to match(/<link rel='icon' type='image\/x-icon' href='(.*)'>/)
    end
  end

  describe ".logo_tag" do
    it "return logo tag" do
      expect(logo_tag).to match(/<a href='(.*)' data-turbo='false'><img src='(.*)' alt='MaKT'><\/a>/)
    end
  end

  describe ".icon_tag" do
    it "return icon tag" do
      expect(icon_tag("pencil-square")).to match(/<svg(.|\n)*<\/svg>/)
    end

    it "return default icon tag when not found icon" do
      expect(icon_tag("nonexistent_icon")).to match(/<svg(.|\n)*<\/svg>/)
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

  describe ".link" do
    it "return empty link when no pass arguments" do
      expect(link).to eq("<a></a>")
    end

    it "return link with class" do
      expect(link(class: "my-class")).to eq("<a class=\"my-class\"></a>")
    end

    it "return link with href" do
      expect(link("#")).to eq("<a href=\"#\"></a>")
    end

    it "return link with data" do
      expect(link(data: { turbo: true, action: "Some Action" })).to eq("<a data-turbo=\"true\" data-action=\"Some Action\"></a>")
    end
  end
end
