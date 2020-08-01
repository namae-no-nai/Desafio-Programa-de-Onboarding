# # frozen_string_literal: true

require_relative '../../lib/models/name'
require 'spec_helper'

describe Name do
  name = Name.new

  context 'should get history of' do
    it 'a single name' do
      json = File.read('spec/name_ranking_json/single_name.json')
      stub_request(:get, 'https://servicodados.ibge.gov.br/api/v2/censos/nomes/Guilherme').to_return(status: 200, body: json)
      result = name.ranking('Guilherme')

      expect(result[0]).to eq 'Nome: Guilherme'
      expect(result[1]).to eq 'Decada: | Frequencia'
      expect(result[2]).to eq('1930    |  1174')
      expect(result[5]).to eq('1960    |  5118')
      expect(result[10]).to eq('2010    |  279111')
    end
  end
end
