class User < ApplicationRecord
  acts_as_voter
  has_many :replies , dependent:  :destroy

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  # Include default devise modules
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :authentication_keys => {email:false,login: false}

  # Virtual attribute for authenticating by either username or email
  attr_accessor :login
  
  before_save :downcase_fields

  def downcase_fields
    self.username = username.downcase if username.present?
    self.email = email.downcase if email.present?
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if (login = conditions.delete(:login))
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end

end



