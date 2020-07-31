# frozen_string_literal: true

require_relative '../lib/models/state'
require 'spec_helper'

describe State do
  it 'should return an array' do
    uf = State.new('spec/file_parser/populacao_2019.csv')
    expect(uf.all_states.class).to eq Array
  end

  it 'should have 27 elements' do
    uf = State.new('spec/file_parser/populacao_2019.csv')
    expect(uf.all_states.length).to eq 27
  end

  it 'first and last should be' do
    uf = State.new('spec/file_parser/populacao_2019.csv')
    expect(uf.all_states.first).to eq %w[11 Rondônia]
    expect(uf.all_states.last).to eq ['53', 'Distrito Federal']
  end
end
