# frozen_string_literal: true

require_relative '../lib/models/city'
require 'spec_helper'

describe City do
  it 'should return an array' do
    uf = City.new('spec/file_parser/populacao_2019.csv')
    expect(uf.all_cities.class).to eq Hash
  end

  it 'should have 5570 elements' do
    uf = City.new('spec/file_parser/populacao_2019.csv')
    expect(uf.all_cities.length).to eq 5570
  end

  it 'first and last should be' do
    uf = City.new('spec/file_parser/populacao_2019.csv')
    expect(uf.all_cities.first).to eq ['Alta Floresta D\'Oeste (RO)', '1100015']
    expect(uf.all_cities['Brasília (DF)']).to eq '5300108'
  end
end
