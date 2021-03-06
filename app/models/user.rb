class User < ApplicationRecord
    has_and_belongs_to_many :events
    validates :first_name, presence: true, length: { maximum: 50 }
    validates :last_name, presence: true, length: { maximum: 50 }
    validates :address, presence: true
    validates :city, presence: true
    validates :state, presence: true
    validates :zip_code, presence: true
    validates :phone_number, presence: true, length: { maximum: 10, minimum: 10 }
    validates :email, presence: true
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
            :recoverable, :rememberable, :trackable, :validatable
    def first_name=(s)
        super s.titleize
    end
    
    def last_name=(s)
        super s.titleize
    end
    
    def address=(s)
        super s.to_s.titleize
    end
    
    def city=(s)
        super s.titleize
    end
    
    def state=(s)
        super s.titleize
    end
end
