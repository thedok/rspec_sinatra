require 'spec_helper'
describe "Menus Controller", :type => :controller do
  let!(:menu) { FactoryGirl.create :menu }
  context "index" do
    it "displays a list of menus by name" do
      get '/'
      expect(last_response.body).to include(menu.name)
    end
    it "doesn't show the menu descriptions" do
      get '/'
      expect(last_response.body).to_not include(menu.description)
    end
  end

  context "create menu" do
    it "creates a menu with valid attributes" do
      pending
    end
    it "doesn't create a menu with invalid attributes" do
      pending
    end
    it "shows errors" do
      pending
    end
  end

  context "show menu" do
    it "displays the menu name" do
      pending
    end
    it "displays the menu description" do
      pending
    end
    it "displays the menu start and end dates" do
      pending
    end
    it "displays a list of all menu items" do
      pending
    end
  end
end
