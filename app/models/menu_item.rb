class MenuItem < ActiveRecord::Base
  belongs_to :menu
  validates :name, :description, :price, :menu, :presence => true

end
