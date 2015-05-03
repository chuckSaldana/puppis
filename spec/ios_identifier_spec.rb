require 'spec_helper'

describe Puppis::Identifier::IOSIdentifier do
  describe '#generate' do
    before(:each) { @identifier = Puppis::Identifier::IOSIdentifier }

    it ' returns a query no matter what' do
      parts = {class: 'foo', query: 'you should see me'}
      expect(@identifier.generate(parts)).to eq('you should see me')
    end
    it 'works with only a class' do
      expect(@identifier.generate({class: 'UIView'})).to eq 'UIView'
    end
    it 'compounds multiple parts' do
      expect(@identifier.generate({class: 'UIView', marked: 'm'})).to eq "UIView marked:'m'"
    end
    it 'handles indexes' do
      expect(@identifier.generate({class: 'UIView', index: 4})).to eq "UIView index:4"
    end
    it 'handles label' do
      expect(@identifier.generate({class: 'UIView', label: 'm'})).to eq "UIView marked:'m'"
    end
  end

  describe '#validate_parts' do
    it 'returns true if the parts are valid' do
      expect(Puppis::Identifier::IOSIdentifier.validate_parts({class: 0})).to eq(true)
    end

    it 'throws an error if the parts are not valid' do
      expect{ Puppis::Identifier::IOSIdentifier.validate_parts({wrong: 'nope'}) }.to raise_error(Puppis::Identifier::InvalidPartsError)
    end

    it 'throws an error when there is no query and no class' do
      expect{ Puppis::Identifier::IOSIdentifier.validate_parts({index: true}) }.to raise_error(Puppis::Identifier::ClassPartMissingError)
    end
  end
end