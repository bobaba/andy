class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.search(page, search)
    if page == "plantdb"
      if search
        where('common ILIKE ? OR binomial ILIKE ? OR description ILIKE ?', "%#{search}%", "%#{search}%", "%#{search}%")
      else
        all
      end
    elsif page == "eventCal"
      if search
        where("location ILIKE ? OR name ILIKE ? OR description ILIKE ? OR strftime('%m/%d/%Y',start_time) ILIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
      else
        all
      end
    end
  end


end
