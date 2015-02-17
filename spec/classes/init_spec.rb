require 'spec_helper'
describe 'websvc' do

  context 'with defaults for all parameters' do
    it { should contain_class('websvc') }
  end
end
