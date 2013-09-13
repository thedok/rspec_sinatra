require 'spec_helper'
describe "Menu Items Controller" do
  let!(:menu_item) { FactoryGirl.create :menu_item }
  context "show menu item" do
    it "displays the name" do
      get "/menu_items/#{menu_item.id}"
      expect(last_response.body).to include(menu_item.name)
    end
    it "displays the description" do
      get "/menu_items/#{menu_item.id}"
      expect(last_response.body).to include(menu_item.description)
    end
    it "displays the price" do
      get "/menu_items/#{menu_item.id}"
      expect(last_response.body).to include(menu_item.price.to_s)
    end
    it "displays the menu name it belongs to" do
      get "/menu_items/#{menu_item.id}" 
      expect(last_response.body).to include(menu_item.menu.name)
    end
  end

  context "create menu item" do
    let!(:menu_item2) { FactoryGirl.build :menu_item }
    it "creates a menu with valid attributes" do
      post '/menu_items', params = { name: menu_item2.name, price: menu_item2.price, description: menu_item2.description, menu_id: menu_item2.menu_id }
      expect(MenuItem.find_by_name(menu_item2.name).should_not be_nil)
    end

    it "doesn't create a menu with invalid attributes" do
      post '/menu_items', params = { price: menu_item2.price, description: menu_item2.description, menu_id: menu_item2.menu_id }
      expect(MenuItem.find_by_name(menu_item2.name).should be_nil)
      post '/menu_items', params = { name: menu_item2.name, description: menu_item2.description, menu_id: menu_item2.menu_id }
      expect(MenuItem.find_by_name(menu_item2.name).should be_nil)
      post '/menu_items', params = { price: menu_item2.price, menu_id: menu_item2.menu_id }
      expect(MenuItem.find_by_name(menu_item2.name).should be_nil)
    end
    it "shows errors saving the menu Items" do
      post '/menu_items', params = { price: menu_item2.price, description: menu_item2.description, menu_id: menu_item2.menu_id }
      expect(last_response.body).to include("Name can't be blank")
    end
  end
end
