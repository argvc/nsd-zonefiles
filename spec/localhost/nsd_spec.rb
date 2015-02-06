require 'spec_helper'

describe package('nsd3') do
  it { should be_installed }
end

describe port(54) do
  it { should be_listening }
end

describe file('/etc/nsd3/nsd.conf') do
  it { should be_file }
end
