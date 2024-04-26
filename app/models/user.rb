class User < ApplicationRecord
    has_many :posts

    validates :name, presence: { message: 'Name cannot be blank' }
    validates :email, presence: { message: 'Email is required' }, uniqueness: { message: 'Email must be unique' }
    validates :password, presence: { message: 'Password is required' }, length: { minimum: 6, message: 'Password must be at least 6 characters long' }

end