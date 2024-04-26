class Post < ApplicationRecord
    belongs_to :user
    has_many :post_tags
    has_many :tags, through: :post_tags
    belongs_to :parent_post, class_name: "Post", optional: true
    has_many :child_posts, class_name: "Post", foreign_key: "parent_post_id"

    validates :title, presence: { message: 'Title cannot be blank' }
    validates :content, presence: { message: 'Content cannot be blank' }
    validates :user_id, presence: { message: 'Post must belong to a user' }
    validates :answers_count, numericality: { greater_than_or_equal_to: 0 }
    validates :likes_count, numericality: { greater_than_or_equal_to: 0 }
    
    before_validation :set_published_at_default
    private
      def set_published_at_default
        self.published_at ||= Time.zone.now
      end
end