class Window < Gosu::Window

  attr_accessor :state

  def initialize
    super WIDTH, WIDTH, false, 100
    self.caption = TITLE
  end

  def button_down(id)
    if id == Gosu::KB_ESCAPE
      close
    end

    @state.button_down(id)
  end

  def update
    @state.update
  end

  def draw
    @state.draw
  end

end
