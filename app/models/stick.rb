class Stick < ActiveRecord::Base
  has_and_belongs_to_many :carts
  has_and_belongs_to_many :orders
  has_attached_file :image, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
