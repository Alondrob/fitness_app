
class Meal < ActiveRecord::Base
    belongs_to :user
    validates :name, :measurement_unit , :weight, :calories, presence: true
    validates :weight, :calories, numericality: { greater_than: 0 }

    def self.total_calories(meals)
        total = 0
        meals.each do |meal|
            total += meal.calories
        end
        total
    end
end