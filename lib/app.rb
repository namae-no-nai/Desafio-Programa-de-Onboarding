# frozen_string_literal: true

require_relative 'models/city'
require_relative 'models/state'
require_relative 'controller/controller'
require_relative 'router'

csv_file = 'data/populacao_2019.csv'
state = State.new(csv_file)
city = City.new(csv_file)
controller = Controller.new(state, city)

router = Router.new(controller)

# Start the app
router.run
