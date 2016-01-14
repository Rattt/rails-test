require File.expand_path('../boot', __FILE__)

require "rails"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsTest
  class Application < Rails::Application

    config.generators do |g|
      g.helper false
      g.javascripts false
      g.template_engine :slim
      g.test_framework :rspec,
                       fixtures: true,
                       view_specs: false,
                       helper_specs: false,
                       routing_specs: false,
                       controller_specs: true,
                       request_specs: true
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
    end

  end
end
