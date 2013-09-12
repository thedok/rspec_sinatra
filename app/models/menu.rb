class Menu < ActiveRecord::Base
  validates :name, :start_at, :presence => true
  before_save :titilize_title

  private
  def titilize_title
    self.name.gsub! '-', ' '
  end
end
