class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :orders
  
  validates :name, :address, presence: true 

  after_initialize do
   if self.new_record?
     self.role ||= :user
   end
  end       
  
  enum role: [:user, :admin]
  
  #Configuración omniauth por google
  def self.from_omniauth(auth)
    where(email: auth.info.email).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,10]
    end  

    #data = access_token.info
    #user = User.where(email: data['email']).first
    # Uncomment the section below if you want users to be created if they don't exist
    # unless user
    #     user = User.create(name: data['name'],
    #        email: data['email'],
    #        password: Devise.friendly_token[0,20]
    #     )
    # end
    #user
  end
end
