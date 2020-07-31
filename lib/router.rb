# frozen_string_literal: true

# Selection of routes
class Router
  def initialize(controller)
    @controller = controller
    @running    = true
  end

  def run
    puts 'Bem vindo ao consulta nomes'
    puts '           --           '

    while @running
      display_tasks
      action = gets.chomp.to_i
      print `clear`
      route_action(action)
    end
  end

  private

  def route_action(action)
    case action
    when 1 then @controller.list
    when 2 then @controller.ask_city
    when 3 then @controller.something
    when 4 then stop

    else
      puts 'Digite 1, 2, 3 ou 4'
    end
  end

  def stop
    @running = false
  end

  def display_tasks
    puts ''
    puts 'Escolha uma opção: '
    puts '1 - Ranking dos nomes mais comuns em uma determinada Unidade Federativa (UF)'
    puts '2 - Ranking dos nomes mais comuns em uma determinada cidade'
    puts '3 - Frequência do uso de um nome ao longo dos anos'
    puts '4 - Sair'
  end
end
