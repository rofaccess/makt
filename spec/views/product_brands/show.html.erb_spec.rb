require 'rails_helper'

RSpec.describe "product_brands/show", type: :view do
  before(:each) do
    assign(:product_brand, ProductBrand.create!(
      name: "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
