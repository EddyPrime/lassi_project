class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  has_many :payement_methods, dependent: :destroy
  has_many :purchases, dependent: :destroy
  has_many :products, dependent: :destroy

  acts_as_user :roles => [ :user, :vendor, :admin ] #user 0, vendor 1, admin 2

  #support fro omniauth
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
        user.name = auth.info.first_name
        user.surname = auth.info.last_name
        user.data = auth.info.birthday
        user.roles = :user
        user.roles_mask = 0
        user.save
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
        if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
            user.email = data["email"] if user.email.blank?
        end
    end
  end



  def how_many_sells
    if (self.roles_mask != 1)
        return
    end
    Product.where(user_id: self.id).count
  end

  def how_many_purchases
    if (self.roles_mask != 0)
        return
    end
    Purchase.where(user_id: self.id).count
  end

  def how_many_payementMethods
    if (self.roles_mask != 0)
        return
    end
    PayementMethod.where(user_id: self.id).count
  end

end
