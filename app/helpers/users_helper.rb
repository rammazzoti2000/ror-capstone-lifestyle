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

  def session_status
    if controller_name == 'sessions'
      'Login'
    else
      'Register'
    end
  end

  def gravatar_image
    unless avatar_present(current_user.avatar)
      gravatar_for(current_user, 'profile-img-lg')
    else
      image_tag(current_user.avatar_url, class: "avatar", id: "previewImage")
    end
  end
end
