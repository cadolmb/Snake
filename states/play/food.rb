class Food

  def initialize
    @x = rand(GRID_NUM) * GRID_WIDTH
    @y = rand(GRID_NUM) * GRID_WIDTH
  end

  def eaten?(x, y)
    return true if x == @x && y == @y
    return false
  end

  def draw
    Gosu.draw_rect(@x, @y, GRID_WIDTH, GRID_WIDTH, Gosu::Color::CYAN)
  end

end
