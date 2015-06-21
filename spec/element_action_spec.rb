require 'spec_helper'

class Dummy
  extend Puppis::ElementAction
end

class CustomDummy
  extend Puppis::ElementAction

  custom_action 'test', ->(){true}
end

describe 'ElementAction' do
  describe '#actions' do
    it 'returns a hash' do
      expect(Dummy.actions).to be_a(Hash)
    end

    it 'defaults to base actions' do
      expect(Dummy.actions).to eq(Puppis::ElementAction::BASE_ACTIONS)
    end
  end

  describe '#custom_action' do
    it 'adds to actions' do
      expect(CustomDummy.actions['test']).to_not be_nil
    end

    it 'has a callable value' do
      expect(CustomDummy.actions['test'].call).to eq(true)
    end
  end

  describe 'BASE_ACTIONS' do
    it 'defines base actions' do
      action_names = %w(touch_{{name}} {{name}}_element wait_for_{{name}} {{name}}_text {{name}}?)
      expect(Puppis::ElementAction::BASE_ACTIONS.keys).to include(*action_names)
    end
  end

end