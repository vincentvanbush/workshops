class ProductDecorator < Draper::Decorator
  include ActionView::Helpers::NumberHelper

  delegate_all

  def avg_rating_formatted
    unless product.average_rating.nan?
      number_with_precision(product.average_rating, precision: 2)
    else
      'No ratings'
    end
  end

  def price_formatted
    number_to_currency(product.price)
  end
end
