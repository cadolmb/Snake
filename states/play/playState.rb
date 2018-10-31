class PlayState < GameState

  def initialize
    @snake = Snake.new
    @food = Food.new

    @song = Gosu::Song.new('./bin/play_song.mp3')
    @food_sound = Gosu::Sample.new('./bin/sfx_food.wav')
  end

  def enter
    @song.play(true)
  end

  def leave
    @song.stop
  end

  def button_down(id)
    @snake.button_down(id)
  end

  def update
    @snake.move

    if @snake.died?
      GameState.switch DeadState.new
    end

    if @food.eaten?(@snake.x, @snake.y)
      @snake.eat
      @food = Food.new
      @food_sound.play
    end
  end

  def draw
    @snake.draw
    @food.draw
  end

end
