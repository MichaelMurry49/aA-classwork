class Cat < ApplicationRecord
    validates :birth_date, :color, :name, :sex, :description, presence: true

    def age
        today = Date.today 
        d = Date.new(today.year, birth_date.month, birth_date.day) 
        age = d.year - birth_date.year - (d > today ? 1 : 0)
    end
end
