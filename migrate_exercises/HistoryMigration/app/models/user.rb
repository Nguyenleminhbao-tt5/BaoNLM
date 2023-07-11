class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    before_save :set_fullname
    
    # enum mode: { guest: 0, client: 1, admin: 2}

    validates :fname, :lname ,length: { minimum: 2 }
    validates :age, numericality: true
    validates :user_type, :sex, presence: true
    validates :password, presence: true, length: { minimum: 8 }
    # validates :email, presence: true, uniqueness: true, format: { with: /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/, message: 'error format email'}
      


    has_many :albums
    has_many :photos

    has_many :clients, class_name: "User",foreign_key: "manage_id"
    belongs_to :admin, class_name: "User", optional: true

    has_many :follows_as_follower, foreign_key: :following_id, class_name: 'Follow'
    has_many :followers, through: :follows_as_follower

    has_many :follows_as_following, foreign_key: :follower_id, class_name: 'Follow'
    has_many :followings, through: :follows_as_following
    

    private
       
    def set_fullname
      self.fullname = "#{fname} #{lname}"
    end
      
end
