class Word < ActiveRecord::Base
  attr_accessible :name, :worddate
  has_many :photos
end
