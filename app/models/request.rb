class Request < ApplicationRecord

  validates :name, presence: true
  validates :email, presence: true,
                    uniqueness: true



  def self.search(query)
        where(['name ILIKE ? OR email ILIKE ? OR department ILIKE ? OR message ILIKE ?', "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%"]).order("
        CASE
          WHEN name ILIKE \'%#{query}%\' THEN '1'
          WHEN email ILIKE \'%#{query}%\' THEN '2'
          WHEN department ILIKE \'%#{query}%\' THEN '3'
          WHEN message ILIKE \'%#{query}%\' THEN '4'
        END")
    end

    # def self.summary
    #   where('department = Sales').count
    # end

end
