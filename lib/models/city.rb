# frozen_string_literal: true

require 'csv'
require 'net/http'
require 'json'

# Cities Repository
class City
  def initialize(cvs_file)
    @url = 'https://servicodados.ibge.gov.br/api/v2/censos/'
    @csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
    @cities = []
    CSV.foreach(cvs_file, @csv_options) do |row|
      @cities << [row[2], row[1]] if row[0] == 'MU'
    end
  end

  def all_cities
    @cities.to_h
  end

  def ranking(town, sex = nil)
    city = @cities.to_h
    exit unless city.key? town
    url_check(city[town.to_s], sex)
  end

  def parsing(url)
    uri = URI(url)
    response = Net::HTTP.get(uri)
    json = JSON.parse(response)
    hash = json[0].to_h
    hash['res'].map { |item| "#{item['ranking']}º  #{item['nome']}" }
  end

  def url_check(id, sex)
    return parsing(@url + "nomes/ranking?localidade=#{id}") if sex.nil?

    parsing(@url + "nomes/ranking?localidade=#{id}&sexo=#{sex}")
  end
end
