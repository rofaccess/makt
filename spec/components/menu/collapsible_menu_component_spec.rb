# frozen_string_literal: true

require "rails_helper"

RSpec.describe Menu::CollapsibleMenuComponent, type: :component do
  it "renders collapsible_menu" do
    render_inline(Menu::CollapsibleMenuComponent.new(icon: "justify", text: "My Menú", id: "my-menu"))

    # Use puts page.native To print html rendered
    expect(page).to have_link "My Menú", class: "o-menu-item", href: nil
  end
end
