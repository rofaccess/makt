class CreateProductBrands < ActiveRecord::Migration[7.0]
  def change
    create_table :product_brands do |t|
      t.string :name, length: 150, null: false

      t.timestamps
    end
  end
end
