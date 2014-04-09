class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  rails_admin do
    label I18n.t('admin.user_admin.menu_name')
    label_plural I18n.t('admin.user_admin.menu_name')

  end
end
