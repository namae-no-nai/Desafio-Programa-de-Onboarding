# frozen_string_literal: true

require_relative '../../lib/models/name'
require 'spec_helper'

describe Name do
  name = Name.new

  context 'should get history of' do
    it 'a 4 names' do
      json = File.read('spec/name_ranking_json/many_names.json')
      stub_request(:get, 'https://servicodados.ibge.gov.br/api/v2/censos/nomes/Guilherme%7CEsmeraldo%7CHeyde%7CDaniel').to_return(status: 200, body: json)
      result = name.ranking('Guilherme, Esmeraldo, Heyde, Daniel')

      expect(result[0]).to eq 'Nome: Daniel'
      expect(result[1]).to eq 'Decada: | Frequencia'
      expect(result[2]).to eq('1930    |  1425')
      expect(result[5]).to eq('1960    |  20672')
      expect(result[10]).to eq('2010    |  194553')
      expect(result[11]).to eq('')

      expect(result[12]).to eq 'Nome: Esmeraldo'
      expect(result[13]).to eq 'Decada: | Frequencia'
      expect(result[14]).to eq('1930    |  198')
      expect(result[17]).to eq('1960    |  1292')
      expect(result[22]).to eq('2010    |  110')
      expect(result[23]).to eq('')

      expect(result[24]).to eq 'Nome: Guilherme'
      expect(result[25]).to eq 'Decada: | Frequencia'
      expect(result[26]).to eq('1930    |  1174')
      expect(result[29]).to eq('1960    |  5118')
      expect(result[34]).to eq('2010    |  279111')
      expect(result[35]).to eq('')

      expect(result[36]).to eq 'Nome: Heyde'
      expect(result[37]).to eq 'Decada: | Frequencia'
      expect(result[38]).to eq('1990    |  88')
      expect(result[39]).to eq('2000    |  36')
      expect(result[40]).to eq('')
    end
  end
end
