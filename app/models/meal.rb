
class Meal < ActiveRecord::Base
    belongs_to :user

    def self.total_calories(meals)
        total = 0
        meals.each do |meal|
            total += meal.calories
        end
        total
    end
end