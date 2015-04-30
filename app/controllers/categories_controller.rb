
# GET /categories
get '/categories' do
  @categories = Category.all
  erb :'categories/index'
end

# GET /categories/:id
get '/categories/:id' do
  @category = Category.find(params[:id])
  erb :'categories/show'
end
