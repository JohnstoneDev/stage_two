require './app'

ENV['RACK_ENV'] ||= 'development'

run Sinatra::Application