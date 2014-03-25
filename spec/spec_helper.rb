$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
Dir[File.expand_path('../../spec/support/**/*.rb', __FILE__)].each { |file| require file }

require 'html_ruby'
