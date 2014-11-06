module ProductsHelper

  def product_link(product, action)
    if action == :edit
      link_to raw('<span class="glyphicon glyphicon-edit"></span>'), edit_category_product_path(product.category, product)
    elsif action == :destroy
      link_to raw('<span class="glyphicon glyphicon-remove"></span>'), category_product_path(product.category, product), method: :delete, data: { confirm: 'Are you sure?' }
    end
  end

  def product_avg_rating_formatted(product)
    if not product.average_rating.nan?
      number_with_precision(product.average_rating, precision: 2)
    else
      'No ratings'
    end
  end

  def product_price_formatted(product)
    number_to_currency(product.price)
  end
end
