class Roulette
  attr_reader
  def initialize
    @historic_numbers = []
    @historic_winners = []
  end

  def play(bet)
    arr = (1..10).to_a
    @winner = arr.sample
    @historic_numbers.push(@winner)
    if bet == @winner
      puts "Ganaste, el número ganador es #{@winner}"
      @historic_winners.push(@winner)
      winners
    else
      puts "Perdiste, el número ganador es #{@winner}."
    end
  end

  def history
    file = File.new('roulette_history.txt', 'a')
    file.write(@historic_numbers)
    file.close
  end
end

  def winners
    file = File.new('winners.txt', 'a')
    file.write(@historic_winners)
    file.close
  end

roulette = Roulette.new
roulette.play(1)
roulette.history
roulette2 = Roulette.new
roulette2.play(6)
roulette2.history
