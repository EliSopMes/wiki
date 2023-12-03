class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :avatar, dependent: :destroy
  has_many :booker_events, class_name: 'Event', foreign_key: 'booker_id'
  has_many :adl_events, class_name: 'Event', foreign_key: 'adl_id'
  has_many :tdl_events, class_name: 'Event', foreign_key: 'tdl_id'
  has_many :developers
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum user_type: %i[bar booking technik buchhaltung adl personalmanagement locationmanagement pr]
end
