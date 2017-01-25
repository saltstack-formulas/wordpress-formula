require "serverspec"

# Set backend type
set :backend, :exec

describe 'wordpress configuration' do

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

  configs = ['/var/html/sitenameA.com/wp-config.php', '/var/html/sitenameB.com/wp-config.php']

  configs.each do |config|
    describe file(config) do
      it { should exist }
      it { should be_file }
      it { should be_mode 644 }
      it { should be_owned_by user }
      it { should be_grouped_into group }
      it { should contain "localhost" }
      it { should contain "dbuser" }
      it { should contain "dbpass" }
      it { should contain "@email.com" }
    end
  end

end
