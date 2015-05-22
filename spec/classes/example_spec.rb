require 'spec_helper'

describe 'ntp' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "ntp class without any parameters" do
          let(:params) {{ }}

          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('ntp::params') }
          it { is_expected.to contain_class('ntp::install').that_comes_before('ntp::config') }
          it { is_expected.to contain_class('ntp::config') }
          it { is_expected.to contain_class('ntp::service').that_subscribes_to('ntp::config') }

          it { is_expected.to contain_service('ntp') }
          it { is_expected.to contain_package('ntp').with_ensure('present') }
        end
      end
    end
  end

  context 'unsupported operating system' do
    describe 'ntp class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { is_expected.to contain_package('ntp') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
