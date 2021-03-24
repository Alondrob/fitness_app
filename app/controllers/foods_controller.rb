class FoodsController < ApplicationController

    #new

    get '/foods' do
      erb :'posts/index'  
    end

    get '/foods/new' do
      erb :'/posts/new'
    end

    #create

    post '/foods' do
    
    end

    #show 

    get '/foods/:id' do
        erb :'foods/show'
    end

    #edit

    get 'foods/:id/edit' do
        erb :"foods/edit"
    end

    #update

    patch 'foods/:id' do
        
    end

    #delete

    delete 'foods/:id/delete' do
        
    end


end