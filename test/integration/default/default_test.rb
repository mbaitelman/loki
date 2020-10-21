# InSpec test for recipe loki::default

# The InSpec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec/resources/


describe service('loki') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end

describe http('localhost:3100/metrics', ssl_verify: false, enable_remote_worker: true) do
  its('status') { should eq 200 }
end
