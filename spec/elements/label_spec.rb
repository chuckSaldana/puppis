require 'spec_helper'

describe Puppis::Elements::Label do
  it 'has a default ios class' do
    expect(Puppis::Elements::Label.default_class :ios).to eq 'UILabel'
  end

  it 'has it\'s own #text' do
    element = Puppis::Elements::Label.new(class: 'UILabel')
    allow(element).to receive(:query) { [{'text' => 'hi'}] }
    expect(element.text).to eq 'hi'
  end
end