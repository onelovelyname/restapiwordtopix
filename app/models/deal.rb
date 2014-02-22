class Deal < ActiveRecord::Base
  attr_accessible :dealCarrier, :departDate, :destinationCity, :minTotalRate, :returnDate, :word_id
end
