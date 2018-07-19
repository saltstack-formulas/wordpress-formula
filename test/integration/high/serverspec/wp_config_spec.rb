require "serverspec"

# Set backend type
set :backend, :exec

describe 'wordpress configuration' do

    configs = ['/www/html/sitenameA.com/wp-config.php', '/www/html/sitenameB.com/wp-config.php']

    configs.each do |config|
        describe file(config) do
            it { should exist }
            it { should be_file }
            it { should be_mode 644 }
            it { should be_owned_by 'www-data' }
            it { should be_grouped_into 'www-data' }
            it { should contain "dbuser" }
        end
    end
end