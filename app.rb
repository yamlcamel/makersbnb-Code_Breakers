require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require_relative './model/space_handler'
require 'pg'
require_relative './model/user_handler'

class MakersBnB < Sinatra::Base 
  enable :sessions
  register Sinatra::Flash

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  get '/add_space' do
    erb :add_space
  end

  post '/add_space' do
    SpaceHandler.add_space(space_name: params[:space_name], 
space_description: params[:space_description], price_per_night: params[:price_per_night])
    redirect '/display_spaces'
  end

  get '/display_spaces' do
    @spaces = SpaceHandler.get_spaces
    erb :display_spaces
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up' do
    UserHandler.create_user(user_name: params[:user_name], password: params[:password])
    redirect '/sign_in'
  end

  get '/sign_in' do 
    erb :sign_in
  end 

  post '/sign_in' do 
    user = UserHandler.authentication(user_name: params[:user_name], password: params[:password])
    if user 
      session[:user_name] = user.user_name
      session[:user_id] = user.user_id
      redirect '/'
    else
      flash[:notice] = "Invalid Login Attempt"
      redirect '/sign_in'
    end 
  end

  get '/sign_out' do 
    session.clear
    flash[:notice] = "You have signed out."
    redirect '/'
  end 
  
  run! if app_file == $0
end
