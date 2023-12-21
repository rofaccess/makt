# frozen_string_literal: true

require "rails_helper"

RSpec.describe Breadcrumb::BreadcrumbItemComponent, type: :component do
  it "renders breadcrumb_item" do
    render_inline(Breadcrumb::BreadcrumbItemComponent.new(icon: "justify", text: "My Breacrumb"))

    expect(page).to have_css "li.c-breadcrumb__item", text: "My Breacrumb"
    expect(page).to have_css "span.c-breadcrumb__item-icon", text: nil
    expect(page).to have_css "span.c-breadcrumb__item-text", text: "My Breacrumb"
  end

  it "renders breadcrumb_item without icon" do
    render_inline(Breadcrumb::BreadcrumbItemComponent.new(text: "My Breacrumb"))

    expect(page).to have_css "li.c-breadcrumb__item", text: "My Breacrumb"
    expect(page).not_to have_css "span.c-breadcrumb__item-icon"
    expect(page).to have_css "span.c-breadcrumb__item-text", text: "My Breacrumb"
  end

  it "renders menu_item without text" do
    render_inline(Breadcrumb::BreadcrumbItemComponent.new(icon: "justify"))

    expect(page).to have_css "li.c-breadcrumb__item", text: nil
    expect(page).to have_css "span.c-breadcrumb__item-icon", text: nil
    expect(page).not_to have_css "span.c-breadcrumb__item-text"
  end
end
