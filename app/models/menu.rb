class Menu < ActiveRecord::Base
  validates :name, :start_at, :presence => true
end
