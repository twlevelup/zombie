require 'simplecov'

Dir["lib/*"].each {|file| require_relative "../lib/#{File.basename(file, ".rb")}"}

SimpleCov.start do
  SimpleCov.minimum_coverage 100
  add_filter '/spec/'
end
