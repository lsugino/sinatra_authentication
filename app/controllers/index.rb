get '/' do
  # render home page
 #TODO: Show all users if user is signed in
  @all_users = User.all
  erb :index
end

#----------- SESSIONS -----------

get '/sessions/new' do
  # render sign-in page 
  erb :sign_in
end

post '/sessions' do
  @user = User.find_by_email(params[:email])

  if @user.password == params[:password]
    session[:id] = @user.id
    redirect '/'
  else
    erb :sign_in
  end
  # sign-in
end

delete '/sessions/:id' do
  session[:id] = nil
  redirect '/'
  # sign-out -- invoked via AJAX
end

#----------- USERS -----------

get '/users/new' do
  # render sign-up page
  erb :sign_up
end

post '/users' do

  @user = User.create(params[:user])

  if @user
    p "bye"
    redirect '/sessions/new'
  else
    p "hello"
    erb :sign_up
    # dont create session
  end

  # sign-up a new user
end
