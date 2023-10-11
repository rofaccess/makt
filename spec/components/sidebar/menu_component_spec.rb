# frozen_string_literal: true

require "rails_helper"

RSpec.describe Sidebar::MenuComponent, type: :component do
  it "renders menu" do
    render_inline(Sidebar::MenuComponent.new(text: "Menu"))

    expect(page).to have_link "Menu", class: "sidebar-link", href: "#"
  end

  it "renders active menu" do
    render_inline(Sidebar::MenuComponent.new(text: "Menu", active: true))

    expect(page).to have_css "li.sidebar-item.active", text: "Menu"
  end

  it "renders inactive menu" do
    render_inline(Sidebar::MenuComponent.new(text: "Menu", active: false))

    expect(page).not_to have_css "li.sidebar-item.active", text: "Menu"
  end

  it "renders menu with icon" do
    render_inline(Sidebar::MenuComponent.new(icon: "boxes", text: "Menu"))

    expect(page).to have_css "i.bi.bi-boxes"
  end

  it "renders menu without icon" do
    render_inline(Sidebar::MenuComponent.new(text: "Menu"))

    expect(page).not_to have_css "i.bi"
    expect(page).not_to have_css "i.bi-boxes"
  end

  it "renders menu with turbo true" do
    skip "Until not add turbo attr"

    render_inline(Sidebar::MenuComponent.new(text: "Menu"))

    expect(page).to have_link "Menu", class: "sidebar-link", href: "#", turbo: "true"
  end

  it "renders menu with turbo false" do
    render_inline(Sidebar::MenuComponent.new(text: "Menu"))

    expect(page).to have_link "Menu", class: "sidebar-link", href: "#", turbo: "false"
  end

  it "renders menu without submenus" do
    render_inline(Sidebar::MenuComponent.new(text: "Menu"))

    expect(page).not_to have_css "li.sidebar-item.has-sub"
    expect(page).not_to have_css "ul.submenu"
  end

  it "renders menu with submenus" do
    render_inline(Sidebar::MenuComponent.new(text: "Menu")) do |menu|
      menu.with_submenus(
        [
          { text: "Submenu 1", url: "/submenu1" },
          { text: "Submenu 2" }
        ]
      )
    end

    expect(page).to have_css "li.sidebar-item.has-sub"
    expect(page).to have_css "ul.submenu"

    expect(page).to have_link "Submenu 1", class: "submenu-link", href: "/submenu1"
    expect(page).to have_link "Submenu 2", class: "submenu-link", href: "#"
  end
end
