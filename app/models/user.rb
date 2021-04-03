
class User < ActiveRecord::Base
    has_secure_password
    validates :name, :height, :email, :weight, :age, :sex, presence: true
    validates :weight, :age, numericality: { greater_than: 0 }
    has_many :meals, dependent: :destroy
end