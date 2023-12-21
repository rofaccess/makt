# frozen_string_literal: true

require "rails_helper"

RSpec.describe Breadcrumb::BreadcrumbComponent, type: :component do
  it "renders breadcrumb" do
    render_inline(Breadcrumb::BreadcrumbComponent.new) do |breadcrumb|
      breadcrumb.with_items(
        [
          { icon: "justify" },
          { text: "Warehouses" },
          { text: "Warehouse One" }
        ]
      )
    end

    # Use puts page.native To print html rendered
    expect(page).to have_css "li.c-breadcrumb__item", text: nil
    expect(page).to have_css "li.c-breadcrumb__item", text: "Warehouses"
    expect(page).to have_css "li.c-breadcrumb__item", text: "Warehouse One"
  end
end
