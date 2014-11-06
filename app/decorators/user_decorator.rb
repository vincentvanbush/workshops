class UserDecorator < Draper::Decorator
  include ActionView::Helpers::AssetTagHelper
  include ActionView::Helpers::UrlHelper

  delegate_all

  def full_name
    user.firstname + ' ' + user.lastname
  end

  def latest_reviews
    user.reviews.order("created_at").decorate.last(5)
  end

  def has_reviews?
    !latest_reviews.empty?
  end

  def gravatar(options = { size: 80 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    link_to image_tag(gravatar_url, alt: user.email + "'s Gravatar", class: "gravatar img-responsive"), "http://gravatar.com/#{gravatar_id}"
  end

end
