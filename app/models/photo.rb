class Photo < ActiveRecord::Base
  attr_accessible :url, :user_id, :word_id
  belongs_to :word

  def as_json(options= {})
  	{
  		url: self.url,
  		word: self.word_id
  	}
  end
  
end
