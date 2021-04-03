require 'pry'
class MealsController < ApplicationController

  get '/meals/new' do
    erb :"meals/new"
   
  end

  post '/meals' do
    meal = Meal.new(params)
    meal.user = current_user
    if meal.save
       redirect "/meals/#{meal.id}"
    else
      redirect to '/meals/new'
    end
  end

  get '/meals/:id' do
    @meal = Meal.find_by_id(params[:id])
    # @meal.user = current_user
    erb :"meals/show"
  end

  get '/meals' do
    redirect_if_not_logged_in
    user_meals = current_user.meals
    @meals = user_meals.to_a.group_by { |meal| meal.created_at.to_date }
    # @meals.user = current_user
    erb :"meals/index"
 end

 delete '/meals/:id' do
    if logged_in?
      meal = Meal.find_by_id(params[:id])
      if current_user == meal.user
         meal.destroy
      end
        redirect to "/users/#{current_user.id}"
    else
      redirect to "/users/#{current_user.id}"
    end
  end


  get '/meals/:id/edit' do
    redirect_if_not_logged_in
    @meal = Meal.find_by_id(params[:id])
    erb :"meals/edit"
  end

  patch '/meals/:id' do
     redirect_if_not_logged_in
      meal = Meal.find_by_id(params[:id]) 
     if current_user == meal.user
        if meal.update(name: params[:name], measurement_unit: params[:measurement_unit], weight: params[:weight], calories: params[:calories])
          redirect to '/meals'
        else
          redirect to "/meals/#{meal.id}/edit"
        end    
     end
     redirect to '/meals'
  end



end