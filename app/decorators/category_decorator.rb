class CategoryDecorator < Draper::Decorator
  delegate_all

  def top_five_products
    category.products.select { |p| not p.average_rating.nan? }.sort_by { |p| p.average_rating }.reverse.first(5)
  end

  def latest_five_products
    category.products.order("created_at").first(5)
  end
end
