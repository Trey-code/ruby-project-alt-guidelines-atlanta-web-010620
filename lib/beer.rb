class Beer < ActiveRecord::Base
    has_many :beer_lists
    has_many :users, through: :beer_lists
end