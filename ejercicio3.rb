class Roulette
  attr_reader :winner

  def play(bet)
    history = []
    arr = (1..10).to_a
    winner = arr.sample
    history.push(winner)
    puts winner
    print history
    puts "Ganaste, el número ganador es #{winner}" if bet == winner
  end

  def history
    file = File.new('roulette_history.txt', 'w')
    file.write(history)
    file.close
  end
end
roulette = Roulette.new
roulette.play(5)
