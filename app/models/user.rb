class User < ActiveRecord::Base
  has_many :challenges
  has_many :movies, :through => :challenges
end
