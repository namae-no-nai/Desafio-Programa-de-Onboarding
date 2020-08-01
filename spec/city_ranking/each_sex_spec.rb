# frozen_string_literal: true

require_relative '../../lib/models/city.rb'
require 'spec_helper'

describe City do
  file = 'data/populacao_2019.csv'
  city = City.new(file)

  it 'should get ranking for woman in São Paulo (SP)' do
    json = File.read('spec/uf_ranking_json/woman.json')
    response = JSON.parse(json)
    stub_request(:get, 'https://servicodados.ibge.gov.br/api/v2/censos/nomes/ranking?localidade=3550308&sexo=F').to_return(status: 200, body: json)

    result = city.ranking(3_550_308, 'F')

    (0..19).each do |index|
      expect(result[index]).to eq "#{response[0]['res'][index]['ranking']}º  #{response[0]['res'][index]['nome']}"
    end
  end

  it 'should get the ranking for man in São Paulo (SP)' do
    json = File.read('spec/uf_ranking_json/man.json')
    response = JSON.parse(json)
    stub_request(:get, 'https://servicodados.ibge.gov.br/api/v2/censos/nomes/ranking?localidade=3550308&sexo=M').to_return(status: 200, body: json)

    result = city.ranking(3_550_308, 'M')

    (0..19).each do |index|
      expect(result[index]).to eq "#{response[0]['res'][index]['ranking']}º  #{response[0]['res'][index]['nome']}"
    end
  end
end
