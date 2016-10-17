class Request < ApplicationRecord

  def self.search(query)
        #This first line will search BOTH columns, as it's a chain
        #Product.where(['title ILIKE ?', "%#{query}%"]).where(['description ILIKE ?', "%#{query}%"])
        #The following searches for EITHER or
        where(['name ILIKE ? OR email ILIKE ? OR department ILIKE ? OR message ILIKE ?', "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%"]).order("
        CASE
          WHEN name ILIKE \'%#{query}%\' THEN '1'
          WHEN email ILIKE \'%#{query}%\' THEN '2'
          WHEN department ILIKE \'%#{query}%\' THEN '3'
          WHEN message ILIKE \'%#{query}%\' THEN '4'
        END")
    end

end
