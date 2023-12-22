require 'rails_helper'

RSpec.describe "product_brands/index", type: :view do
  before(:each) do
    assign(:product_brands, [
      ProductBrand.create!(
        name: "Product Brand 1"
      ),
      ProductBrand.create!(
        name: "Product Brand 2"
      )
    ])
  end

  it "renders a list of product_brands" do
    render
    cell_selector = "tr>td"
    assert_select cell_selector, text: Regexp.new("Product Brand".to_s), count: 2
  end
end
