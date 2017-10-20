class Tasklist < ApplicationRecord

  has_many :tasks, dependent: :destroy
  belongs_to :user

  validates :name, presence: { message: 'Tasklist Name is mandatory' },
                   uniqueness: { message: 'Tasklist already exist' }

  # Perform case-insensitive search on name for a particular id
  def self.search(search_term)
    search_term ||=  ''
    lowercase_search_term = search_term.downcase
    where('LOWER(name) LIKE ?', "%#{lowercase_search_term}%")
  end

  # Return only the records for page=page
  def self.paginate(record_per_page, page)
    limit(record_per_page).offset( (page - 1) * record_per_page )
  end

end
