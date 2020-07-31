# frozen_string_literal: true

require 'csv'
require 'net/http'
require 'json'
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
end
