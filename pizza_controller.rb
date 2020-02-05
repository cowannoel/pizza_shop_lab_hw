require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

require_relative('./models/pizza_order')
also_reload('./models/*')

# READ - all/index
get '/pizza-orders' do
  @orders = PizzaOrder.all()
  erb(:index)
end

#CREATE - NEW

get '/pizza-orders/new' do
  erb(:new)
end


#CREATE - CREATE

post '/pizza-orders' do
  @order = PizzaOrder.new(params)
  @order.save()
  erb(:create)
end


# READ - one/show
get '/pizza-orders/:id' do
  @order = PizzaOrder.find(params[:id])
  erb(:show)
end


#UPDATE

get '/pizza-orders/:id/edit' do
  @order = PizzaOrder.find(params[:id])
  erb(:edit)
end

post '/pizza-orders/:id' do
  order = PizzaOrder.new(params)
  order.update()
  redirect "/pizza-orders"
end

#DELETE

post '/pizza-orders/:id/delete' do
  order = PizzaOrder.find(params[:id])
  order.delete
  erb(:delete)
end

get '/locations' do
  erb(:locations)
end

get '/contact' do
  erb(:contact)
end
