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
  print table_list
end

txt_to_table('casino.txt')
