class Person

    @@count=0
    def initialize(name,age)
        @name = name
        @age = age

        @@count+=1
        
    end

    def get_name
        return @name
    end

    def get_age
        return @age
    end

    def set_name(name)
        @name = name

    end

    def set_age(age)
        @age = age
    end

    def introduce()
        print "My name is #{@name}. I'm #{@age} years old"
    end

    def total_count()
        puts @@count
    end


end

# print people

def print_value arr
    arr.each do |ele|
        puts "#{ele.get_name}-#{ele.get_age}"
    end
end


# 1.  
person1 = Person.new('bao',21)

# 2. class

# 3. class

# 4. class

# 5. class

# 6. class

# 7

people = []

21.times do |index|
    people.push(Person.new("Person #{index}",rand(10..90)))
end


puts "================================================================"


# 8  : in person co tuoi nho hon 18
puts "8."
people_less_18 = people.select{ |person| person.get_age < 18}

print_value(people_less_18)

puts "================================================================"


# 9 : xoa person co tuoi nho hon 18

puts "9."
people.each do |person|
    if people_less_18.include?(person)
        people.delete(person)
    end
end

print_value(people)

puts "================================================================"


#10 : sort people theo tuoi tang dan
puts "10."
print_value(people.sort_by{ |a| a.get_age})                # case 1
print_value(people.sort{ |a,b| a.get_age <=> b.get_age })  # case 2


puts "================================================================"


#11 : sort people theo tuoi giam dan
puts "11."

print_value(people.sort{ |a,b| b.get_age <=> a.get_age })



puts "================================================================"


#12 : xoa mot phan tu tai vi tri xac dinh cho truoc
puts "12."
index_delete = 1

people.delete(index_delete)

puts "================================================================"


#13 : Max , min theo tuoi
puts "13."

print_value(people)
max_age = people.max{|a,b| a.get_age <=> b.get_age}
min_age = people.min{|a,b| a.get_age <=> b.get_age}
puts "Max: #{max_age.get_name}- Min: #{min_age.get_name}"


puts "================================================================"


#14 : tao mang co cac element co tuoi tang 1 don vi
puts "14."

people.each do |person|
    person.set_age(person.get_age+1)
end

print_value(people)

puts "================================================================"


#15 : in tat ca cac element trong people khong dung vong lap
puts "15."

people.map { |person| puts "#{person.get_name}-#{person.get_age}" }

puts "================================================================"


#16 : tao mang people_2 roi noi voi mang people
puts "16."

people_2 = []

21.times do |index|
    people_2.push(Person.new("Person #{index}",rand(10..90)))
end

people+=people_2


puts "================================================================"


#17 : tao 1 exception
puts "17."

begin
    a=10
    b=0
    puts a/b
    raise ZeroDivisionError
    rescue ZeroDivisionError => e 
        puts e.message
end










    


