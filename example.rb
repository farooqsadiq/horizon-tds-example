# frozen_string_literal: true
require 'dotenv/load'
require 'sequel'
require 'tiny_tds'
require 'awesome_print'


opts = {
  adapter: 'tinytds',
  login_timeout: 5, 
  timeout: 10, 
  tds_version: '50',   #42 or 50
  host:     ENV['APP_HZ_HOST'],
  port:     ENV['APP_HZ_PORT'],
  database: ENV['APP_HZ_DATABASE'],
  username: ENV['APP_HZ_USER'],
  password: ENV['APP_HZ_PASSWORD']
}
bib_id = Integer( ARGV[0] || 0 )
tag_num =  ARGV[1] || ''

sql = "SELECT  * FROM [bib] WHERE bib#=? AND tag=?"
DB = Sequel.connect opts
dataset = DB[sql, bib_id, tag_num]
dataset.each do |row|
  ap row
end

