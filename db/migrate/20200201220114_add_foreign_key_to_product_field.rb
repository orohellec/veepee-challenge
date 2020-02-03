class AddForeignKeyToProductField < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :product_fields, :product_types
  end
end
