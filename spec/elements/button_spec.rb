require 'spec_helper'

describe Puppis::Elements::Button do
  it 'has a default ios class' do
    expect(Puppis::Elements::Button.default_class :ios).to eq 'UIButton'
  end
end