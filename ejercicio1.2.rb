class Table
  attr_reader :income, :name
  def initialize(name, *income)
    @name = name
    @income = income.map(&:to_i)
  end
end
table_list = []

file = File.open('casino.txt', 'r')
file.readlines.each do |ele|
  data = ele.delete("\n").split(', ')
  table_list << Table.new(*data)
end
file.close

#OPCIÓN 1
# def max_value(obj)
#   table = obj.name
#   max = obj.income.max
#   day = obj.income.index(max)
#   puts "La máxima recaudación de la #{table} se logró el día #{day+1} y fue de $#{max}."
# end
#max_value(table_list[0])

def max_value(list)
  list.each_with_index do |_ele, index|
    table = list[index].name
    max_value = list[index].income.max
    day = list[index].income.index(max_value)
    puts "La máxima recaudación de la #{table} se logró el día #{day+1} y fue de $#{max_value}."
  end
end

def average(list)
  average = []
  list.each_with_index do |_ele, index|
    average << list[index].income.inject {|sum,x| sum + x}.to_f/list[index].income.size
  end
  final_average = average.inject { |sum, x| sum + x }.to_f / average.size
  puts "El promedio de lo recaudado en total es de $#{final_average}."
end

max_value(table_list)
average(table_list)
