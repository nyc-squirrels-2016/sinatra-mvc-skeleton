get '/login' do
	erb :"login"
end


get '/register' do 
	erb :"register"
end


post '/login' do
  @user = User.find_by(username: params[:username])
  if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect '/'
  else
    @error = true
    erb :"login"
  end
end


post '/register' do
  @user = User.new(username: params[:username])
  @user.password = params[:password]
  if @user.save
    redirect "/"
  else
    @error = true
    erb :"register"
  end
end

post '/logout' do
  session.clear
  redirect '/'
end



