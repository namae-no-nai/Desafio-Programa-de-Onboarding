# frozen_string_literal: true

require 'csv'
require 'net/http'
require 'json'

URL = 'https://servicodados.ibge.gov.br/api/v2/censos/'

# Cities Repository
class City
  def initialize(cvs_file)
    @csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
    @cities = []
    CSV.foreach(cvs_file, @csv_options) do |row|
      @cities << [row[2], row[1]] if row[0] == 'MU'
    end
  end

  def all_cities
    @cities.to_h
  end
end
