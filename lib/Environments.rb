
require 'pry'
require 'httparty'
require 'json'
require 'dotenv'
Dotenv.load


require_relative "./Kichens/API.rb"
require_relative "./Kichens/CLi.rb"
require_relative "./Kichens/Dishes.rb"
require_relative "./Kichens/version.rb"
require "Foodies/version"

module Foodies
  class Error < StandardError; end
  # Your code goes here...
end


#listing all dependencies 