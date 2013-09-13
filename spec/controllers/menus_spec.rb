require 'spec_helper'
require 'faker'
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
    let!(:menu2) { FactoryGirl.build :menu }
    it "creates a menu with valid attributes" do  
      post '/menus', params = { name: menu2.name, start_at: menu2.start_at }
      expect(Menu.find_by_name(menu2.name).should_not be_nil)
    end
    let!(:menu3) { FactoryGirl.build :menu }
    it "doesn't create a menu with invalid attributes" do
      post '/menus', params = { name: "Doktor" }
      expect(Menu.find_by_name("Doktor").should be_nil)
    end

    it "shows errors" do
      post '/menus', params = { name: "Doktor" }
      expect(last_response.body).to include("Start at can't be blank")
      
      post '/menus', params = { start_at: Time.now }
      expect(last_response.body).to include("Name can't be blank")
    end
  end

  context "show menu" do
    it "displays the menu name" do
      get "menus/#{menu.id}"
      expect(last_response.body).to include(menu.name)
    end
    it "displays the menu description" do
      get "menus/#{menu.id}"
      expect(last_response.body).to include(menu.description)
    end
    it "displays the menu start and end dates" do
      get "menus/#{menu.id}"
      expect(last_response.body).to include(menu.start_at.to_s)
      expect(last_response.body).to include(menu.end_at.to_s)
    end
    it "displays a list of all menu items" do
      10.times { menu.menu_items << FactoryGirl.create(:menu_item) }
      get "menus/#{menu.id}"
      expect(last_response.body).to include(menu.menu_items.sample.name)
    end
  end
end
