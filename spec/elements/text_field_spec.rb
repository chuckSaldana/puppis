require 'spec_helper'

describe Puppis::Elements::TextField do
  it 'has a default ios class' do
    expect(Puppis::Elements::TextField.default_class :ios).to eq 'UITextField'
  end

  it 'adds an = method' do
    expect(Puppis::Elements::Label.actions.keys).to include('{{name}}=')
  end

  it 'adds a {{name}} method' do
    expect(Puppis::Elements::Label.actions.keys).to include('{{name}}')
  end
end