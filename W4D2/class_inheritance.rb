class Employee

    def initialize(name, title, salary, boss)
        @name, @title, @salary, @boss = name, title, salary, boss

    end

    def bonus(multiplier)
        bonus = multiplier * salary
    end

    protected

    attr_reader :name, :title, :salary, :boss

end

class Manager < Employee

    def initialize(name, title, salary, boss)
        super(name, title, salary, boss)
        @boss = nil
        @employees = []
    end

    def bonus(multiplier)
        sum = 0
        @employees.each { |emp| sum += emp.salary }
        bonus = sum * multiplier
    end

    def add_emp(emp)
        @employees << emp
    end

end