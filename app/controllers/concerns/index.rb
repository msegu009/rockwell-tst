enable :sessions

get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/user/new' do
  erb :new_user
end

post '/user/new' do
  p params

  @user = User.create( firstname: params[:firstname], 
                              lastname: params[:lastname], 
                              email: params[:email], 
                              password_digest: params[:password_digest] )

  session[:user_id] = @user.id

  redirect "/user/#{@user.email}"
end

get '/login' do
  erb :login
end

post '/login' do
  user = User.authenticate(email: params[:email], password_digest: params[:password_digest])

  if user
    session[:user_id] = user.id
    redirect to "/user/#{user.email}"
  else
  	#####IMPLEMENT: LOGIN ERROR MESSAGE.
    redirect to '/login'
  end
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end

get '/user/:email' do
  user = User.find_by_email(params[:email])
  @user_id = user.id if user

  
  if @user_id
    erb :profile
  else 
  	#####IMPLEMENT: NO USER FOUND
  	redirect '/'
  end

end
