class Order < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :balls
  has_and_belongs_to_many :sticks
end
