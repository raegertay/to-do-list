class Tasklist < ApplicationRecord

  has_many :tasks, dependent: :destroy

  validates :name, presence: { message: 'Tasklist Name is mandatory' },
                   uniqueness: { message: 'Tasklist already exist' }

  def self.search(search_term)
    search_term ||=  ''
    lowercase_search_term = search_term.downcase
    where('LOWER(name) LIKE ?', "%#{lowercase_search_term}%")
  end

end
