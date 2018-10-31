class DeadState < GameState

  def initialize
    @font = Gosu::Font.new(100)
    @msg = "You Died"
    @start_time = Gosu.milliseconds
    @time_passed = 0
    @end_time = 4000

    @dead_sound = Gosu::Sample.new('./bin/sfx_die.wav')
  end

  def enter
    @dead_sound.play
  end

  def leave
  end

  def button_down(id)
  end

  def update
    @time_passed = Gosu.milliseconds - @start_time
    if @time_passed > @end_time
      GameState.switch MenuState.new
    end
  end

  def draw
    a = Math.sin((Math::PI * @time_passed - 1000) / (@end_time - 1000))*200
    color = Gosu::Color.new(a, 255, 0, 0)
    @font.draw_rel(
      @msg, WIDTH / 2, WIDTH / 2, 0, 0.5, 0.5, 1, 1, color
    )
  end

end
