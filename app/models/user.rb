class User < ApplicationRecord

  has_secure_password
  has_many :tasklists, dependent: :destroy

  validates :name, presence: { message: 'Username is mandatory' },
                   uniqueness: { message: 'Username already exist' }

end
