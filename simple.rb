# frozen_string_literal: true


require 'dotenv/load'
require 'tiny_tds'
require 'awesome_print'

opts = { 
	login_timeout: 5, 
	timeout: 10, 
	tds_version: '50',   #42 or 50
	host:     ENV['APP_HZ_HOST'],
	port:     ENV['APP_HZ_PORT'],
	database: ENV['APP_HZ_DATABASE'],
	username:     ENV['APP_HZ_USER'],
	password: ENV['APP_HZ_PASSWORD']
}

begin
	client = TinyTds::Client.new( opts )
	ap client
	sql = 'SELECT  * FROM [bib] WHERE bib#=13371'
	results = client.execute( sql )
	results.each do |row|
		ap row
	end
	results.cancel
	client.close
rescue TinyTds::Error => e
	ap 'TDS ERROR: ' + e.message 
end
