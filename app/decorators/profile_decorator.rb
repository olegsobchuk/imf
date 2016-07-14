class ProfileDecorator
  attr_reader :profile

  def method_missing(method_name, *args, &block)
    profile.send(method_name, *args, &block)
  end

  def respond_to_missing?(method_name, include_private = false)
    profile.respond_to?(method_name, include_private) || super
  end

  def initialize(profile)
    raise ArgumentError, 'Decorator for Profile' unless profile.is_a?(Profile)
    @profile = profile
  end

  def avatar_thumb
    if image_id = profile.avatar_id
      info = FlickrService.get_info(image_id)
      FlickRaw.url_t(info)
    end
  end
end
