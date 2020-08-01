# frozen_string_literal: true

require 'net/http'
require 'json'
# Name frequency
class Name
  def initialize
    @url = 'https://servicodados.ibge.gov.br/api/v2/censos/nomes/'
    @csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
  end

  def ranking(nome)
    formated_name = nome.gsub(',', '%7C').gsub(' ', '')
    exit unless formated_name.ascii_only?
    url = @url + formated_name
    uri = URI(url)
    response = Net::HTTP.get(uri)
    json = JSON.parse(response)
    show(json)
  end

  def show(json)
    result = []
    json.each do |items|
      result << "Nome: #{items['nome'].capitalize}"
      result << 'Decada: | Frequencia'
      items['res'].each do |item|
        result << "#{decade(item['periodo'])}    |  #{item['frequencia']}"
      end
      result << ''
    end
    result
  end

  def decade(period)
    decade_star = period.split('[').join.split(',')[0]
    decade_end = period.split('[').join.split(',')[1]
    return decade_star unless decade_end

    decade_end
  end
end
