# require 'rubygems'
# require 'active_support/core_ext'
# require 'json'
require 'bgg-api'

bgg = BggApi.new
result = bgg.search( {:query => "carson", :type => 'boardgame'} )
# json = Hash.from_xml(result).to_json
puts result

# result = BggApi.search_by_name('Carson')

# puts result
# puts json
