# frozen_string_literal: true

require_relative '../../lib/models/state.rb'
require 'spec_helper'

describe State do
  file = 'data/populacao_2019.csv'
  state = State.new(file)

  it 'should get ranking most used names for woman in SP ' do
    json = File.read('spec/uf_ranking_json/woman.json')
    response = JSON.parse(json)
    stub_request(:get, 'https://servicodados.ibge.gov.br/api/v2/censos/nomes/ranking?localidade=35&sexo=F').to_return(status: 200, body: json)

    result = state.ranking(35, 'F')

    (0..19).each do |index|
      expect(result[index]).to eq "#{response[0]['res'][index]['ranking']}º  #{response[0]['res'][index]['nome']}"
    end
  end

  it 'should get ranking most used names for man in SP' do
    json = File.read('spec/uf_ranking_json/man.json')
    response = JSON.parse(json)
    stub_request(:get, 'https://servicodados.ibge.gov.br/api/v2/censos/nomes/ranking?localidade=35&sexo=M').to_return(status: 200, body: json)

    result = state.ranking(35, 'M')

    (0..19).each do |index|
      expect(result[index]).to eq "#{response[0]['res'][index]['ranking']}º  #{response[0]['res'][index]['nome']}"
    end
  end
end
