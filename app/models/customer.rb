class Customer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :authentications
  attr_accessor :current_password
  validates_presence_of :first_name, :last_name, :pid, :phone, :zip_code, :address
  validates_format_of :pid, :with => /\A\d{11}$\z/, :on => :create
  validates_format_of :phone, :with => /\A\d{9}$\z/, :on => :create
  validates_format_of :zip_code, :with => /\A\d{3,7}$\z/, :on => :create

  def apply_omniauth(omni)
    authentications.build(:provider => omni['provider'],
                          :uid => omni['uid'],
                          :token => omni['credentials'].token,
                          :token_secret => omni['credentials'].secret)
  end

  def password_required?
    (authentications.empty? || !password.blank?) && super
  end

  def update_with_password(params)
    if encrypted_password.blank?
      #raise params.inspect
      update_attributes(params)
    else
      super
    end
  end
end
