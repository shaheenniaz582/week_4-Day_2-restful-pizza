require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative('./models/pizza_order')
also_reload('./models/*')
# this controller will return some html
# that shows all of the pizza orders in a nice list

get '/pizza-orders' do
  #we first to need all the pizza orders

  #then will passs the pizza orders into a global variable
   @orders = PizzaOrder.all()

  #render the index route html
  erb(:index)
end
# this route should return html page that has
# form to create new pizza orders

get '/pizza-orders/new' do
  erb(:new)
end

#This route shoud return some
#html that shows single pizza order.

get '/pizza-orders/:id' do
  order_id = params[:id]
  # first, grab the order id from the url
  # Get Pizza order - by calling find on pizza porder
  #  and by passing in the id we have got from params
  @order = PizzaOrder.find(order_id)
  # Render the show page for that order
  erb(:show)
end
# this route should accept post requests on pizza-Orders
# then take the posts parameters
# then create a new pizza order

post '/pizza-orders' do
  @order = PizzaOrder.new(params)
  @order.save()
  erb(:create)

end

post '/pizza-orders/:id/delete' do
  order_id = params[:id]
  @order = PizzaOrder.find(order_id)
  @order.delete()
  erb(:delete)

end

get '/pizza-orders/:id/edit' do
  order_id = params[:id]
  @order = PizzaOrder.find(order_id)
  erb(:edit)
end

post '/pizza-orders/:id' do
  order_id = params[:id]
  @order= PizzaOrder.find(order_id)
  @order.update()

end
