require 'pry'

class UsersController < ApplicationController

    get '/users/new' do
        erb :"users/new"
    end

    post '/users' do
        @user = User.create(params)
        session[:user_id] = @user.id
        redirect "/users/#{@user.id}"
    end

    get '/users/:id' do
        @user = User.find_by_id(params[:id])
        erb :"users/show"
    end

    get '/logout' do
        session[:user_id] = nil
        redirect '/users/new'
    end

    get '/login' do
        erb :"users/login"
    end

    post '/login' do
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect "/users/#{@user.id}"
        else
            erb :"users/login"
        end
    end

    get '/users' do
        redirect_if_not_logged_in
        @users = User.all
        erb :"users/index"
    end

end