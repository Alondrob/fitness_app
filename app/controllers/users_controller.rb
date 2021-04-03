require 'pry'

class UsersController < ApplicationController

    get '/users/new' do
        erb :"users/new"
    end

    post '/users' do
         
        user = User.new(params)
        if user.save
            session[:user_id] = user.id
            redirect "/users/#{user.id}"   
        else
            redirect to '/users/new'
        end  
    end

    get '/homepage' do
        if current_user 
           
        redirect "/users/#{current_user.id}" 
        else
         redirect to '/login'
        end
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

    get '/users/:id/edit' do
        redirect_if_not_logged_in
        @user = User.find_by_id(params[:id])
        erb :"users/edit"
    end

    patch '/users/:id' do
        redirect_if_not_logged_in
        user = User.find_by_id(params[:id])
        if user == current_user
            if user.update(name: params[:name], email: params[:email], weight: params[:weight], height: params[:height])
               redirect "/users/#{user.id}" 
            else
               redirect "/users/#{current_user.id}/edit"
            end
        end
         redirect "/users/#{user.id}"
    end

    delete '/users/:id' do
        redirect_if_not_logged_in
            user = User.find_by_id(params[:id])
            # binding.pry
            if  user == current_user
                session[:user_id] = nil
                user.destroy
            end
                redirect to '/users/new'
    end

end