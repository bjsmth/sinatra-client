
# GET /users
get '/users' do
  @users = User.all
  erb :'users/index'
end

# GET /users/:id
get '/users/:id' do
  @user = User.find(params[:id])

  erb :'user/show'
end
