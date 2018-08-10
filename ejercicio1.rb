
class Table
  attr_reader :income, :name
  def initialize(name, *income)
    @name = name
    @income = income.map(&:to_i)
  end
end

def txt_to_table(txt)
  table_list = []
  file = File.open(txt, 'r')
  file.readlines.each do |ele|
    data = ele.delete("\n").split(', ')
    table_list << Table.new(*data)
  end
  file.close
  table_list
end

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
  average.inject { |sum, x| sum + x }.to_f / average.size
end

table = txt_to_table('casino.txt')

max_value(table)
puts "El promedio de lo recaudado en todas mesas es de $#{average(table)}."
