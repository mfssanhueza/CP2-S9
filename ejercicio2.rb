require 'date'
class Course
  attr_reader :name, :date
  def initialize(name, *date)
    @name = name
    @date = date.map { |ele| Date.parse(ele) }
  end
end

courses = []

file = File.open('cursos.txt', 'r')
file.readlines.each do |line|
  dates = line.delete("\n").split(', ')
  courses << Course.new(*dates)
end
file.close

def start_before(list, start_date)
  raise ArgumentError.new('ERROR') if start_date >= 2018-01-01
  puts "Los cursos que empiezan antes del #{start_date} son:"
  list.each_with_index do |_ele, index|
    if list[index].date[0] < start_date
      puts "#{list[index].name} empieza el #{list[index].date[0]}"
    end
  end
end

def end_after(list, end_date)
  raise ArgumentError.new('ERROR') if end_date >= 2018-01-01
  puts "Los cursos que termiann después del #{end_date} son:"
  list.each_with_index do |_ele, index|
    if list[index].date[1] > end_date
      puts "#{list[index].name} termina el #{list[index].date[1]}"
    end
  end
end
start_before(courses, Date.today)
end_after(courses, Date.today)
