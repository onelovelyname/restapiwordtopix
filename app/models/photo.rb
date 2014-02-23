class Photo < ActiveRecord::Base
  attr_accessible :url, :user_id, :word_id
  belongs_to :word
end
