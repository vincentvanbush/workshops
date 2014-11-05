class UserDecorator < Draper::Decorator
  delegate_all

  def full_name
    user.firstname + ' ' + user.lastname
  end

  def latest_reviews
    user.reviews.order("created_at").last(5)
  end

  def has_reviews?
    !latest_reviews.empty?
  end

end
