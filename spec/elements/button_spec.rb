require 'spec_helper'

describe Puppis::Elements::Button do
  it 'has a default ios class' do
    expect(Puppis::Elements::Button.default_class :ios).to eq 'UIButton'
  end

  it 'has it\'s own #text' do
    element = Puppis::Elements::Button.new(class: 'UIButton')
    allow(element).to receive(:query) { [{'text' => 'hi'}] }
    expect(element.text).to eq 'hi'
  end
end