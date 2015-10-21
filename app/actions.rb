# Homepage (Root path)
get '/' do
  erb :index
end

get '/songs' do
  @songs = Song.all
  erb :'songs/index'
end

get '/songs/new' do
  @song = Song.new
  erb :'songs/new'
end

get '/songs/:id' do
  @song = Song.find params[:id]
  erb :'songs/show'
end

post '/songs' do 
  @song = Song.new(
    title: params[:title],
    author: params[:author],
    url: params[:url],
    created_at: Time.now
  )

  if @song.save
    redirect '/songs'
  else
    erb :'songs/new'
  end
end

get '/signup' do
  @user = User.new
  erb :'login/signup'
end

post '/signup' do
  @user = User.new(
    first_name: params[:first_name],
    last_name: params[:last_name],
    email: params[:email],
    password: params[:password]
  )

  if @user.save
    redirect '/songs'
  else
    erb :'login/signup'
  end
end


get '/login' do
  @user = User.new
  erb :'login/login_index'
end

post '/login' do
    if User.find_by(email: params[:email], password: params[:password])
      redirect '/songs'
    else
      @message = "error with username or password!"
      @user = User.new(email: params[:email], password: params[:password])
      erb :'login/login_index'
  end
end

