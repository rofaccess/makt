# frozen_string_literal: true

require "rails_helper"

RSpec.describe Menu::MainMenuComponent, type: :component do
  it "renders main_menu" do
    render_inline(Menu::MainMenuComponent.new)

    # Use puts page.native To print html rendered
    expect(page).to have_link "Menú", class: "o-menu-item", href: nil
  end
end
