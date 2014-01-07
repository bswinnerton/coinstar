require 'coveralls'
Coveralls.wear!

Dir[File.dirname(__FILE__) + '/../lib/*.rb'].each { |file| require file }
