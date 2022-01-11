require "./player.rb"

class MathGame
  attr_accessor :player1, :player2, :current_player, :turn_num
  
  def initialize
    self.player1 = Players.new("Player 1")
    self.player2 = Players.new("Player 2")
    self.turn_num = 0
    self.current_player = self.player1
  end
  
  def new_turn
    if self.turn_num >= 1
      puts "----- NEW TURN -----"
    end

    # 2 numbers btwn 1...20
    random_num1 = rand(1...20)
    random_num2 = rand(1...20)
    # solultion to question
    solution = random_num1 + random_num2

    # Game ask question
    puts "#{self.current_player.name}: What does #{random_num1} plus #{random_num2} equal?"
    current_player_reply = gets.chomp.to_i
    
    # player answer question
    if solution == current_player_reply
      puts "#{self.current_player.name}: YES! You are correct."
    else
      puts "#{self.current_player.name}: Seriously? No!"
      self.current_player.lose_life
    end
    self.end_turn
  end

  def end_turn
    # output new scores for noth player
    puts "P1: #{self.player1.lives}/3 vs p2: #{self.player2.lives}/3"

    # if current player change to next player
    if self.current_player == self.player1
      self.current_player = self.player2
    else
      self.current_player = self.player1
    end
    self.turn_num += 1
    self.end_game
  end

  def end_game
    # end when one player loses all their lives
    if self.player1.lives == 0 || self.player2.lives == 0
      if self.player1.lives > self.player2.lives
        winner = self.player1
      else
        winner = self.player2
      end
      
      # announce who won and their score
      puts "#{winner.name} wins with a score of #{winner.lives}/3"
      # Good bye message
      puts "------- GAME OVER ---------"
      puts "Good bye!"

    else
      self.new_turn
    end
  end

  def start_game
    self.new_turn
  end
end