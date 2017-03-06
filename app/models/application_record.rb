class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

# SQLITE3/DEVELOPING
  # def self.search(page, search)
  #   if page == "plantdb"
  #     if search
  #       where('common LIKE ? OR binomial LIKE ? OR description LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%")
  #     else
  #       all
  #     end
  #   elsif page == "eventCal"
  #     if search
  #       where("location LIKE ? OR name LIKE ? OR description LIKE ? OR strftime('%m/%d/%Y',start_time) LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
  #     else
  #       all
  #     end
  #   end
  # end


#POSTGRES/PRODUCTION
  def self.plantSearch(search)
      if search
        where('common ILIKE ? OR binomial ILIKE ? OR description ILIKE ?', "%#{search}%", "%#{search}%", "%#{search}%")
      else
        all
      end
  end

  def self.calSearch(search)
      if search
        where("location ILIKE ? OR name ILIKE ? OR description ILIKE ? OR strftime('%m/%d/%Y',start_time) ILIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
      else
        all
      end
  end


end
