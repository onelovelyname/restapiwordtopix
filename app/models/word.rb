require 'net/http'

class Word < ActiveRecord::Base
  attr_accessible :name, :worddate
  has_many :photos

  def as_json(options= {})
  	puts options
  	if options['single']
	  	{
	  		id: 	self.id,
	  		name: 	self.name,
	  		photos: self.photos,
	  		deal: 	self.get_Deal
	  	}
	else 
	  	{
	  		id: 	self.id,
	  		name: 	self.name
	  	}
	end		
  end

  def get_Deal
  	source = "http://api.ean.com/expe/affinity/v1/get/destinations?format=json&userId=launch&affinity=#{self.name}&apiKey=nk2nd4w9g3qxa6ekmzvjuhmj"
  	resp = Net::HTTP.get_response(URI.parse(source))
  	data = resp.body
  	result = JSON.parse(data)
  	top_result = result['searchResults']['searchResult'][0]['results']['result'][0]['item']
  	city_result = top_result['location']['address']['city']
  	#state_result = top_result['location']['address']['state']


  	source_flight = "http://api.ean.com/expe/deals/flights.json?apiKey=nk2nd4w9g3qxa6ekmzvjuhmj&destinationCity=#{CGI.escape city_result}"
  	resp = Net::HTTP.get_response(URI.parse(source_flight))
  	data = resp.body
  	result_flight = JSON.parse(data)
  	deal_result = result_flight[0]

  	deal_result

  end


end
