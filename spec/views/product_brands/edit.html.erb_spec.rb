require 'rails_helper'

RSpec.describe "product_brands/edit", type: :view do
  let(:product_brand) {
    ProductBrand.create!(
      name: "MyString"
    )
  }

  before(:each) do
    assign(:product_brand, product_brand)
  end

  it "renders the edit product_brand form" do
    render

    assert_select "form[action=?][method=?]", product_brand_path(product_brand), "post" do

      assert_select "input[name=?]", "product_brand[name]"
    end
  end
end
