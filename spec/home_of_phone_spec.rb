require 'spec_helper'

describe HomeOfPhone do
  let(:home_of_phone) { HomeOfPhone.new }

  it 'has a version number' do
    expect(HomeOfPhone::VERSION).not_to be nil
  end

  describe '#similarity' do

    it 'returns a similarity score for two valid words' do
      expect(home_of_phone.similarity("joking", "choking")).not_to be_nil
    end

    it 'returns a similarity score of 100 for two of the same word' do
      expect(home_of_phone.similarity("turtle", "turtle")).to eq 100
    end
    
  end

end
