# Set up gems listed in the Gemfile.
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' if File.exist?(ENV['BUNDLE_GEMFILE'])

#solve The connection was reset rails
#http://stackoverflow.com/questions/26570609/rails-4-2-0-beta2-cant-connect-to-localhost
require 'rails/commands/server'

module Rails
  class Server
    alias :default_options_alias :default_options
    def default_options
      default_options_alias.merge!(:Host => '0.0.0.0')
    end
  end
end