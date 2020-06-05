module UsersHelper
  def gravatar_for(user, class_name)
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=200"
    image_tag(gravatar_url, alt: user.name, class: class_name)
  end

  def avatar(user, class_name)
    if user.avatar_url.present?
      image_tag(user.avatar_url, alt: user.name, class: class_name)
    else
      gravatar_for(user, class_name)
    end
  end

  def avatar_present(avatar)
    avatar.present?
  end
end
