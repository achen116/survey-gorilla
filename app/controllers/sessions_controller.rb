get '/' do
  if session[:user_id]
    redirect '/surveys'
  else
    erb :signin
  end
end

post '/' do
  @user = User.where(username: params[:username]).first
  if @user && (@user.password == params[:password_hash])
    session[:user_id] = @user.id
    redirect '/surveys'
  else
    @errors = "Invalid user"
    erb :signin
  end
end

get '/signup' do
  erb :signup
end

post '/signup' do
  if params[:password_hash] == params[:verify_password]
    user = User.new(
    name: params[:name],
    username: params[:username],
    password_hash: params[:password_hash]
    )
    user.password = params[:password_hash]

    if user.save
      session[:user_id] = user.id
      redirect '/surveys'
    else
      @errors = "Invalid"
      erb :signup
    end
  else
    @errors = "Your passwords don't match!"
    erb :signup
  end
end

get '/signout' do
  session[:user_id] = nil
  redirect '/'
end
