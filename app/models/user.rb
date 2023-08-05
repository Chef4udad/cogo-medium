class User < ApplicationRecord
    has_secure_password
    validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }
    has_many :blogs, dependent: :destroy

    has_many :followed_relationships, foreign_key: :follower_id, class_name: 'Follow', dependent: :destroy
    has_many :followed_users, through: :followed_relationships, source: :followed

    has_many :follower_relationships, foreign_key: :followed_id, class_name: 'Follow', dependent: :destroy
    has_many :followers, through: :follower_relationships, source: :follower
end
