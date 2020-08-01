# frozen_string_literal: true

require 'csv'
require 'net/http'
require 'json'

URL = 'https://servicodados.ibge.gov.br/api/v2/censos/'

# States Repository
class State
  def initialize(cvs_file)
    @url = 'https://servicodados.ibge.gov.br/api/v2/censos/'
    @csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
    @states = []
    CSV.foreach(cvs_file, @csv_options) do |row|
      @states << [row[1], row[2]] if row[0] == 'UF'
    end
  end

  def all_states
    @states
  end

  def ranking(id, sex = nil)
    exit unless @states.to_h.key? id.to_s
    url = url_check(id, sex)
    uri = URI(url)
    response = Net::HTTP.get(uri)
    json = JSON.parse(response)
    hash = json[0].to_h
    hash['res'].map { |item| "#{item['ranking']}º  #{item['nome']}" }
  end

  def url_check(id, sex)
    if sex.nil?
      URL + "nomes/ranking?localidade=#{id}"
    else
      URL + "nomes/ranking?localidade=#{id}&sexo=#{sex}"
    end
  end
end
