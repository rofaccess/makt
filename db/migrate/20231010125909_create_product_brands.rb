class CreateProductBrands < ActiveRecord::Migration[7.0]
  def change
    create_table :product_brands do |t|
      t.string :name, length: 150, null: false, unique: true

      t.timestamps
    end

    add_index :product_brands, :name, unique: true
  end
end
