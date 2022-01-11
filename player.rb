class Players
  attr_accessor :lives, :name

  def initialize(n)
    self.name = n
    self.lives = 3
  end

  def lose_life
    # decrement lives -1 when mis-answer
    self.lives -= 1
  end

  def dead?
    self.lives = 0
  end
end