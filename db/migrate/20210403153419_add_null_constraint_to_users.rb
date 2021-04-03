class AddNullConstraintToUsers < ActiveRecord::Migration
  def change
    change_column_null :users, :email,  false
    change_column_null :users, :name,   false
    change_column_null :users, :weight, false
    change_column_null :users, :height, false
    change_column_null :users, :sex,    false
    change_column_null :users, :age,    false
  end
end
