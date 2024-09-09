module UsersHelper
  def gravatar_for(user, options = { size: 80 })
    email_address = user.email.downcase
    hash = Digest::SHA256.hexdigest(email_address)
    size = options[:size]
    default = "https://www.gravatar.com/avatar/?s=#{size}"
    params = URI.encode_www_form("d" => default, "s" => size)
    gravatar_url = "https://www.gravatar.com/avatar/#{hash}?#{params}"
    image_tag(gravatar_url, alt: user.username, class: "rounded-circle shadow mx-auto d-block mt-3")
  end
end
