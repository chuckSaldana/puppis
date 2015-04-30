require 'spec_helper'

describe 'Puppis::Config' do
  describe '#platform' do
    it 'defaults to ios' do
      expect(Puppis::Config.platform).to eq(:ios)
    end

    it 'can be set' do
      Puppis::Config.platform = :android
      expect(Puppis::Config.platform).to eq(:android)
    end
  end

  describe '#platform=' do
    it 'accepts a valid platform' do
      Puppis::Config.platform = :android
      expect(Puppis::Config.platform).to eq(:android)
    end

    it 'throws an error when an invalid platform is set' do
      expect{Puppis::Config.platform = :bad}.to raise_error(Puppis::Config::InvalidConfig)
    end
  end
end