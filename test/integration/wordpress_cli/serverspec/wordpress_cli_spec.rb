require "serverspec"

# Set backend type
set :backend, :exec

describe 'wordpress cli tool' do
  case os[:family]
  when 'debian'
    case os[:release]
    when '7.11'
      user = 'www-data'
      group = 'www-data'
    when '8.6'
      user = 'www-data'
      group = 'www-data'
    end
  when 'redhat'
    user = 'apache'
    group = 'apache'
  when 'ubuntu'
    case os[:release]
    when '14.04'
      user = 'www-data'
      group = 'www-data'
    when '16.04'
      user = 'www-data'
      group = 'www-data'
    end
  end

  wp_cli = '/usr/local/bin/wp'

  describe file(wp_cli) do
    it { should exist }
    it { should be_mode 740 }
    it { should be_owned_by user }
    it { should be_grouped_into group }
  end
end
