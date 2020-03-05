require 'byebug'

class Employee

  def initialize(name, title, salary, boss)
    @name =  name
    @title = title
    @salary = salary
    @boss = boss
    @boss.employees << self if @boss != nil
  end

  def bonus(multiplier)
    bonus = salary * multiplier

  end

  attr_accessor :salary, :name, :title, :boss

end

class Manager < Employee
  attr_accessor :employees
  def initialize(name, title, salary, boss)
    super
    @employees = []
  end

  def bonus(multiplier)
    sum = 0
    # debugger
    @employees.each do |employee|
      # if employee.is_a(Manager)
      #   employee.employee
      # end 
      sum += employee.bonus(multiplier)
    end
    sum * multiplier if boss == nil
    sum
  end

end

ned = Manager.new("Ned", 'Founder', 1000000, nil)
darren = Manager.new('Darren', 'TA Manager', 78000, ned)
shawna = Employee.new('Shawna', 'TA', 12000, darren)
david  = Employee.new('David', 'TA', 10000, darren)


p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000
p ned.employees
p darren.employees

