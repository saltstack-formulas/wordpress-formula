require "serverspec"

# Set backend type
set :backend, :exec

describe 'wordpress cli tool' do

    wp_cli = '/usr/local/bin/wp'

    describe file(wp_cli) do
        it { should exist }
        it { should be_mode 740 }
        it { should be_owned_by 'www-data' }
        it { should be_grouped_into 'www-data' }
    end
end