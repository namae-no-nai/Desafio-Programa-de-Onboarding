# frozen_string_literal: true

require_relative '../../../lib/models/state.rb'
require 'spec_helper'

describe State do
  file = 'spec/file_parser/populacao_2019.csv'
  state = State.new(file)

  it 'should get general Ranking for SP ' do
    json = File.read('spec/file_parser/uf_ranking_json/general.json')
    response = JSON.parse(json)
    stub_request(:get, 'https://servicodados.ibge.gov.br/api/v2/censos/nomes/ranking?localidade=35').to_return(status: 200, body: json)

    result = state.ranking(35)

    expect(result.class).to eq Array
    expect(result.length).to eq 20

    (0..19).each do |index|
      expect(result[index]).to eq "#{response[0]['res'][index]['ranking']}º  #{response[0]['res'][index]['nome']}"
    end
  end
end
