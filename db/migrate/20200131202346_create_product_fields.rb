class CreateProductFields < ActiveRecord::Migration[6.0]
  def change
    create_table :product_fields do |t|
      t.string :name
      t.string :field_type
      t.boolean :required
      t.references :product_type
      t.timestamps
    end
  end
end
