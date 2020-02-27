# Item::valid_date?(date_string)
# This method should accept a string and return a boolean indicating if it is valid date of the form YYYY-MM-DD where Y, M, and D are numbers, such as 1912-06-23. 
# The month should be a number from 1 to 12 and the day should be a number from 1 to 31. Here are examples of the expected behavior:

class Item 
    attr_reader :done
    def self.valid_date?(date)
        parts = date.split("-")
        parts.all? { |part| part.is_a?(Integer) }
        return false if parts[0].length != 4
        month = parts[1]
        return false if month.length != 2 || (month.to_i > 12 || month.to_i <= 0)
        day = parts[2]
        return false if day.length != 2 || (day.to_i > 31 || day.to_i <= 0)
        true
    end

    def initialize(title,deadline,description)
        @title = title
        if Item.valid_date?(deadline)
        @deadline = deadline
        else
            p "INVALID DATE"
        end
        @description = description
        @done = false
    end

    def title
        @title 
    end

    def title=(new_title)
        @title = new_title
    end

    def deadline
        @deadline
    end

    def deadline=(new_deadline)
         if Item.valid_date?(new_deadline)
            @deadline = new_deadline
         else
            raise 'Invalid date'
         end
    end

    def description
        @description
    end

    def description=(new_description)
        @description = new_description
    end

    def toggle
        @done = !@done
    end

end
