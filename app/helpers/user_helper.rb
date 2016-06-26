module UserHelper
  def info_if_defined(info)
    info || 'Was not defined'
  end

  def user_avatar(image_id)
    if image_id
      info = FlickrService.get_info(image_id)
      image_tag(FlickRaw.url_t(info))
    end
  end
end
