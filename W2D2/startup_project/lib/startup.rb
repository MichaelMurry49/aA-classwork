require "employee"

class Startup
    attr_reader :name, :funding, :salaries, :employees
    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def valid_title?(title)
        @salaries.has_key?(title)
    end

    def >(another_startup)
        self.funding > another_startup.funding
    end

    def hire(employee_name, title)
        return @employees << Employee.new(employee_name,title) if valid_title?(title)
        raise "error"
    end

    def size
        @employees.length
    end

    def pay_employee(person)
        salary = salaries[person.title]
        if salary > @funding
            raise "error"
        else 
            person.pay(salary)
            @funding -= salary
        end   
    end

    def payday
        @employees.each {|employee| pay_employee(employee)}
    end

    def average_salary
        sum = 0
        @employees.each { |employee| sum += @salaries[employee.title] }
        sum / @employees.length
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(another_startup)
        @funding += another_startup.funding
        another_startup.salaries.each { |k, v| @salaries[k] = v  if !@salaries.has_key?(k) }
        @employees += another_startup.employees
        another_startup.close
    end
end
