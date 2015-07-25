$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'github_mapper'

require 'minitest/autorun'

require 'vcr'
require 'webmock'

VCR.configure do |config|
  config.cassette_library_dir = "test/vcr_cassettes"
  config.hook_into :webmock
end
