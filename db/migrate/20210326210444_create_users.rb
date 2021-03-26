class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email, null: false
      t.string :sex
      t.string :height
      t.float :weight
      t.integer :age
      t.string :password_digest
      t.timestamps
    end
  end
end
