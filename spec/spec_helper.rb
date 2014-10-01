require 'simplecov'

SimpleCov.start do
  SimpleCov.minimum_coverage 100
  add_filter '/spec/'
end