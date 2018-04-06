class User < ActiveRecord::Base
  has_many :carts
  has_one :current_cart, class_name: 'Cart'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         def after_sign_out_path_for(user)
           store_path
         end
end
