class Snake

  attr_accessor :x, :y

  def initialize
    @x = WIDTH / 2
    @y = WIDTH / 2
    @tail = [[@x, @y]]
    @length = 1
  end

  def button_down(id)
    case id
    when Gosu::KB_LEFT
        @dir = 'left' unless @dir == 'right' && @length != 1
    when Gosu::KB_RIGHT
        @dir = 'right' unless @dir == 'left' && @length != 1
    when Gosu::KB_UP
        @dir = 'up' unless @dir == 'down' && @length != 1
    when Gosu::KB_DOWN
        @dir = 'down' unless @dir == 'up' && @length != 1
    end
  end

  def move
    case @dir
    when 'left'
      @x -= GRID_WIDTH
    when 'right'
      @x += GRID_WIDTH
    when 'up'
      @y -= GRID_WIDTH
    when 'down'
      @y += GRID_WIDTH
    end

    @x %= WIDTH
    @y %= WIDTH

    @tail.prepend [@x, @y]
    @tail.pop if @tail.length > @length
  end

  def died?
    if  @x < 0 || @x > WIDTH - GRID_WIDTH ||
        @y < 0 || @y > WIDTH - GRID_WIDTH
      return true
    end

    @tail.each_index do |i|
      unless i == 0
        return true if @tail[i] == @tail[0]
      end
    end
    false
  end

  def eat
    @length += 1
  end

  def draw
    STDOUT.flush
    @tail.each do |box|
      Gosu.draw_rect(
        box[0] + 1, box[1] + 1, GRID_WIDTH - 1, GRID_WIDTH - 1,
        Gosu::Color::WHITE
      )
    end
  end

end
