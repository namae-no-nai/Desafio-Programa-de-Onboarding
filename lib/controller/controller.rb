# frozen_string_literal: true

require_relative '../views/view'
require 'csv'
require 'net/http'
require 'json'

# Single controller in a 1-model MVC
class Controller
  def initialize(models = {})
    @name = models[:name]
    @city = models[:city]
    @state = models[:state]
    @view = View.new
  end

  def list
    states = @state.all_states
    id = @view.ask(states)
    list_ranking(id)
  end

  def ask_city
    id = @view.ask_location
    list_cities(id)
  end

  def list_cities(id)
    names = @city.ranking(id)
    @view.list(names, 'Geral')
    names = @city.ranking(id, 'M')
    @view.list(names, 'Masculino')
    names = @city.ranking(id, 'F')
    @view.list(names, 'Feminino')
  end

  def list_ranking(id)
    names = @state.ranking(id)
    @view.list(names, 'Geral')
    names = @state.ranking(id, 'M')
    @view.list(names, 'Masculino')
    names = @state.ranking(id, 'F')
    @view.list(names, 'Feminino')
  end

  def ask_name
    names = @view.ask_name
    result = @name.ranking(names)
    @view.name_ranking(result)
  end
end
