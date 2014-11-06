module ProductsHelper

  def product_link(product, action)
    if action == :edit
      link_to raw('<span class="glyphicon glyphicon-edit"></span>'), edit_category_product_path(product.category, product)
    elsif action == :destroy
      link_to raw('<span class="glyphicon glyphicon-remove"></span>'), category_product_path(product.category, product), method: :delete, data: { confirm: 'Are you sure?' }
    end
  end
end
