class MealsController < ApplicationController

  get '/meals/new' do
    erb :"meals/new"
  end

  post '/meals' do
    @meal = Meal.new(params)
    @meal.user = current_user
    @meal.save
    redirect "/meals/#{@meal.id}"
  end

  get 'meals/:id' do
    @meal = Meal.find_by_id(params[:id])
    erb :"meals/show"
  end

end