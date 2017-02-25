class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.search(page, search)
    if page == "plantdb"
      if search
        where('common LIKE ? OR binomial LIKE ? OR description LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%")
      else
        all
      end
    elsif page == "eventCal"
      if search
        where("location LIKE ? OR name LIKE ? OR description LIKE ? OR strftime('%m/%d/%Y',start_time) LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
      else
        all
      end
    end
  end


end
