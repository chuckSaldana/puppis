require 'spec_helper'

describe Puppis do
  let(:subject){ Class.new {
    include Puppis

    element :test
  }}

  before(:all) { Puppis::Config.platform = :ios}

  describe '#class_to_method_name' do
    context 'with one word' do
      it 'converts pascal casing to snake casing' do
        expect(Puppis.class_to_method_name(:Element)).to eq('element')
      end
    end

    context 'with more than one word' do
      it 'converts pascal casing to snake casing' do
        expect(Puppis.class_to_method_name(:MultipleWordClassName)).to eq('multiple_word_class_name')
      end
    end
  end

  describe '#merge_field_and_action' do
    it 'merges when there is a placeholder' do
      expect(Puppis.merge_field_and_action(:field_name, 'action_name')).to eq('action_name')
    end

    it "merges when there isn't a placeholder" do
      expect(Puppis.merge_field_and_action(:merged, 'this_should_be_{{name}}')).to eq('this_should_be_merged')
    end

  end

  describe '#included' do
    it 'adds class methods for elements' do
      expect(subject.methods).to include(:element)
    end

    it 'adds methods for each element' do
      expect(subject.new.methods).to include(:test_element, :touch_test, :wait_for_test)
    end
  end
end