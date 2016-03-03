require_relative 'spec_helper'

describe 'standard elasticsearch install and configure' do
  it_behaves_like 'elasticsearch user'
  it_behaves_like 'elasticsearch install'
  it_behaves_like 'elasticsearch configure'

  # because shield, these now should return failures
  it_behaves_like 'elasticsearch plugin', 'head', response_code: 401
  it_behaves_like 'elasticsearch service', 'elasticsearch', content: 'missing authentication'
end

describe package('elasticsearch') do
  it { should be_installed }
end
