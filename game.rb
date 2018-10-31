require 'gosu'
require_relative 'window.rb'
require_relative 'states/gameState.rb'
require_relative 'states/menuState.rb'
require_relative 'states/play/playState.rb'
require_relative 'states/play/snake.rb'
require_relative 'states/play/food.rb'
require_relative 'states/deadState.rb'

WIDTH = 640
GRID_NUM = 20
GRID_WIDTH = WIDTH / 20
TITLE = 'Snake Game'

$window = Window.new
GameState.switch MenuState.new
$window.show
