class AddNullConstraintToMeals < ActiveRecord::Migration
  def change
    change_column_null :meals, :name,              false
    change_column_null :meals, :measurement_unit,  false
    change_column_null :meals, :weight,            false
    change_column_null :meals, :calories,          false
  end
end
