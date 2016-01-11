module ApplicationHelper
  def gravatar_for(user, options = { size: 80})
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.username, class: "img-circle")
  end

  def current_title
    if logged_in?
      user = User.find_by(id: session[:user_id])
      return "Share Your Ideas By "+user.username
    else
      return "Share Your Ideas"
    end
  end

end
