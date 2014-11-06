class ReviewDecorator < Draper::Decorator
  include ActionView::Helpers::TextHelper

  delegate_all

  def author  
  	user.firstname + ' ' + user.lastname
  end

  def excerpt
  	truncate(content, omission: '...', length: 100)
  end
end
