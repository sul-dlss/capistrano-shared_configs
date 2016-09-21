require 'capistrano/shared_configs/version'

module Capistrano
  module SharedConfigs
  end
end

load File.expand_path('../tasks/shared_configs.rake', __FILE__)
