class User < ActiveRecord::Base
    has_many :beer_lists
    has_many :beers, through: :beer_lists
end