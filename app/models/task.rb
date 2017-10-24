class Task < ApplicationRecord

  belongs_to :tasklist
  validates :name, presence: true, uniqueness: true
  validates :due_date, presence: true


  # Perform case-insensitve search on :name
  def self.search(search_term)
    search_term ||=  ''
    lowercase_search_term = search_term.downcase
    where('LOWER(name) LIKE ?', "%#{lowercase_search_term}%")
  end

end
