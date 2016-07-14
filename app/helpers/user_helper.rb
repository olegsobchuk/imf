module UserHelper
  def info_if_defined(info)
    info || 'Was not defined'
  end

  def user_avatar(image_url)
    image_tag(image_url)
  end
end
