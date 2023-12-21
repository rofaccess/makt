# frozen_string_literal: true

require "rails_helper"

RSpec.describe Menu::MenuItemComponent, type: :component do
  it "renders menu_item" do
    render_inline(Menu::MenuItemComponent.new(text: "My Menu Item"))

    expect(page).to have_link "My Menu Item", class: "o-menu-item", href: nil
  end

  it "renders active menu_item" do
    render_inline(Menu::MenuItemComponent.new(text: "My Menu Item", url: "/"))

    expect(page).to have_css "a.o-menu-item.o-menu-item--active", text: "My Menu Item"
  end

  it "renders inactive menu_item" do
    render_inline(Menu::MenuItemComponent.new(text: "My Menu Item"))

    expect(page).not_to have_css "a.o-menu-item.o-menu-item--active", text: "My Menu Item"
  end

  it "renders menu_item with icon" do
    render_inline(Menu::MenuItemComponent.new(icon: "boxes", text: "My Menu Item"))

    expect(page).to have_css "svg.o-menu-item__icon"
  end

  it "renders menu_item without icon" do
    render_inline(Menu::MenuItemComponent.new(text: "My Menu Item"))

    expect(page).not_to have_css "svg.o-menu-item__icon"
  end

  it "renders menu_item with turbo true" do
    render_inline(Menu::MenuItemComponent.new(text: "My Menu Item", data: { turbo: true }))

    expect(page).to have_link "My Menu Item", class: "o-menu-item", href: nil, turbo: "true"
  end

  it "renders menu_item with turbo false" do
    render_inline(Menu::MenuItemComponent.new(text: "My Menu Item", data: { turbo: false }))

    expect(page).to have_link "My Menu Item", class: "o-menu-item", href: nil, turbo: "false"
  end
end
