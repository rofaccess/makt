require 'rails_helper'

RSpec.describe ProductBrand, type: :model do
  it "save product_brand" do
    product_brand = ProductBrand.new(name: "Nike")
    expect(product_brand.save).to be(true)
  end
end
