# frozen_string_literal: true

require_relative 'city'
require_relative 'state'
require_relative 'controller'
require_relative 'router'

csv_file = 'data/populacao_2019.csv'
state = State.new(csv_file)
city = City.new(csv_file)
controller = Controller.new(state, city)

router = Router.new(controller)

# Start the app
router.run
