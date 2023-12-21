# frozen_string_literal: true

require "rails_helper"

RSpec.describe Menu::MenuBarComponent, type: :component do
  it "renders menu_bar" do
    render_inline(Menu::MenuBarComponent.new) do |menu_bar|
      menu_bar.with_home(icon: "dashboard", text: "Home", url: "/", data: { turbo: true })
      menu_bar.with_shortcuts(
        [
          { icon: "warehouse", text: "Warehouses" },
          { icon: "boxes", text: "Products" }
        ]
      )
      menu_bar.with_main_menu
    end

    # Use puts page.native To print html rendered
    expect(page).to have_link "Home", class: "o-menu-item", href: "/"
    expect(page).to have_link "Warehouses", class: "o-menu-item", href: nil
    expect(page).to have_link "Products", class: "o-menu-item", href: nil
    expect(page).to have_link "Menú", class: "o-menu-item", href: nil
  end
end
