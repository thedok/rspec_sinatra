get '/' do
  @menus = Menu.all
  erb :index
end

post '/menus' do
  @menu = Menu.new(params)
  if @menu.save
    redirect '/'
  else
    @menus = Menu.all
    @errors = @menu.errors.full_messages
    erb :index
  end
end

get '/menus/:id' do
  @menu = Menu.find params[:id]
  erb :show
end

get '/menu_items/:menu_item_id' do
  @menu_item = MenuItem.find(params[:menu_item_id])
  erb :show_item
end

post '/menu_items' do
  @menu_item = MenuItem.new(params)
  if @menu_item.save
    redirect "/menus/#{@menu_item.menu.id}"
  else
    @menu = Menu.find(@menu_item.menu_id)
    @errors = @menu_item.errors.full_messages
    erb :show
  end
end
