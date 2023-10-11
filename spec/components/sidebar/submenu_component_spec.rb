# frozen_string_literal: true

require "rails_helper"

RSpec.describe Sidebar::SubmenuComponent, type: :component do
  it "renders submenu" do
    render_inline(Sidebar::SubmenuComponent.new(text: "Submenu"))

    expect(page).to have_link "Submenu", class: "submenu-link", href: "#"
  end

  it "renders active submenu" do
    render_inline(Sidebar::SubmenuComponent.new(text: "Submenu", url: "/"))

    expect(page).to have_css "li.submenu-item.active", text: "Submenu"
  end

  it "renders inactive submenu" do
    render_inline(Sidebar::SubmenuComponent.new(text: "Submenu"))

    expect(page).not_to have_css "li.submenu-item.active", text: "Submenu"
  end

  it "renders submenu with icon" do
    render_inline(Sidebar::SubmenuComponent.new(icon: "boxes", text: "Submenu"))

    expect(page).to have_css "i.bi.bi-boxes"
  end

  it "renders submenu without icon" do
    render_inline(Sidebar::SubmenuComponent.new(text: "Submenu"))

    expect(page).not_to have_css "i.bi"
    expect(page).not_to have_css "i.bi-boxes"
  end

  it "renders submenu with turbo true" do
    render_inline(Sidebar::SubmenuComponent.new(text: "Submenu", turbo: true))

    expect(page).to have_link "Submenu", class: "submenu-link", href: "#", turbo: "true"
  end

  it "renders submenu with turbo false" do
    render_inline(Sidebar::SubmenuComponent.new(text: "Submenu", turbo: false))

    expect(page).to have_link "Submenu", class: "submenu-link", href: "#", turbo: "false"
  end
end
