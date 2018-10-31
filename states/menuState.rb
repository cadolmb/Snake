class MenuState

  def initialize
    @font = Gosu::Font.new(50)
    @msg = "Press Enter to Play"
    @c = Gosu::Color::CYAN

    @song = Gosu::Song.new('./bin/menu_song.mp3')
    @menu_sound = Gosu::Sample.new('./bin/sfx_menu.wav')

  end

  def enter
    @song.play(true)
  end

  def leave
    @song.stop
  end

  def button_down(id)
    if id == Gosu::KB_RETURN
      @menu_sound.play
      GameState.switch PlayState.new
    end
  end

  def update
  end

  def draw
    @font.draw_rel(
      @msg, WIDTH / 2, WIDTH / 2, 0, 0.5, 0.5, 1, 1, @c
    )
  end

end
