ActiveAdmin.register Product do
  permit_params :name, :price, :user_id, :product_type_id, properties: {}

  controller do
    def new
      if !params[:product_type_id]
        redirect_to admin_get_product_type_path
      else
        @product = Product.new(product_type_id: params[:product_type_id])
      end
    end
  end

  form do |f|
    f.inputs "Users" do
      f.input :user, member_label: Proc.new { |c| "#{c.first_name} #{c.last_name}" }
    end
    f.inputs "Product" do
      f.input :name
      f.input :price
    end
    
    f.inputs "Product properties" do
      f.hidden_field :product_type_id # check if I reallly need this
      f.fields_for :properties, OpenStruct.new(product.properties) do |builder|
        product.product_type.fields.each do |field|
          render "#{field.field_type}", field: field, f: builder
        end
      end
    end
    f.actions
  end
end
