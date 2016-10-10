class Artist < ActiveRecord::Base
  has_many :songs
  has_many :notes
  has_many :genres, through: :songs
  
end
