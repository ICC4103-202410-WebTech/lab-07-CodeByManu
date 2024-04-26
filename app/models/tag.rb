class Tag < ApplicationRecord
    has_many :post_tags
    has_many :posts, through: :post_tags

    validates :name, presence: { message: 'Tag name cannot be blank' }, uniqueness: { message: 'Tag name must be unique' }
    
end