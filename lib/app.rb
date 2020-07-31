# frozen_string_literal: true

require_relative 'state'
require_relative 'controller'
require_relative 'router'

csv_file = 'data/populacao_2019.csv'
state = Repo.new(csv_file)
controller = Controller.new(state)

router = Router.new(controller)

# Start the app
router.run
