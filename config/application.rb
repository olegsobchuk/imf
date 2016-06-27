require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module Imf
  class Application < Rails::Application
    config.active_record.raise_in_transactional_callbacks = true
    config.active_record.belongs_to_required_by_default = true
  end
end

SECRETS = Rails.application.secrets
