class Guild < ActiveRecord::Base
  attr_accessible :achievementPoints, :battlegroup, :level, :name, :realm, :side
end
