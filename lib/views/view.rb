# frozen_string_literal: true

# Response of user interface
class View
  def ask(states)
    states.each do |item|
      puts "#{item[0]} | #{item[1]}"
    end
    puts 'Digite o número correspondente a UF desejada: '
    print '->'
    gets.chomp.to_i
  end

  def ask_location
    puts 'Digite a cidade desejada no formato São Paulo (SP):'
    print '->'
    gets.chomp
  end

  def ask_name
    puts 'Digite os nomes desejados sem acento separados por virgulas (,):'
    print '->'
    gets.chomp
  end

  def list(names, genero)
    puts "Ranking #{genero}"
    puts ''
    puts names
    puts ''
    puts puts '-' * 60
  end

  def name_ranking(result)
    puts result
  end
end
