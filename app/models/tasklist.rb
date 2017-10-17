class Tasklist < ApplicationRecord

  has_many :tasks, dependent: :destroy

  validates :name, presence: { message: 'Tasklist Name is mandatory' },
                   uniqueness: { message: 'Tasklist already exist' }

end
