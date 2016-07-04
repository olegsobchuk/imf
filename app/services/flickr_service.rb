class FlickrService
  class << self
    def photos
      @photos ||= flickr.photos
    end

    def upload(user, image_path)
      image_id = flickr.upload_photo image_path, title: user.id
      flickr.groups.pools.add(group_id: SECRETS[:flickr_group], photo_id: image_id) if image_id
      image_id
    end

    def remove(image_id)
      photos.delete(photo_id: image_id)
    end

    def get_info(image_id)
      photos.getInfo(photo_id: image_id)
    end
  end
end
