require 'rubygems'
require 'bundler/setup'

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
  config.before(:each) do
    reset_system
  end
  config.include(FileDsl)
end