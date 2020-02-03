ActiveAdmin.register ProductType do
  permit_params(:name, fields_attributes: [:name, :required, :field_type, :product_type_id, :_destroy, :id])

  form do |f|
    f.inputs
    f.inputs do
      f.has_many :fields, allow_destroy: true do |field|
        field.input :name
        field.input :required
        field.input :field_type, as: :select, collection: %w[text_field check_box]
      end
    end
    f.actions
  end
end
