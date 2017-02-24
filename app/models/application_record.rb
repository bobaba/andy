class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.search(search)
    if search
      where('common LIKE ? OR binomial LIKE ? OR description LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%")
    else
      all
    end
  end
end
