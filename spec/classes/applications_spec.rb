# frozen_string_literal: true

require 'spec_helper'

describe 'sasl::applications' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }
      let(:pre_condition) do
        "class {'sasl::service': }"
      end
      let(:params) do
        {
          applications: {
            slapd: {
              mech_list: %w[gssapi plain external],
              pwcheck_method: 'saslauthd',
            },
          },
        }
      end

      it { is_expected.to compile.with_all_deps }
      it { is_expected.to contain_sasl__application('slapd').with(pwcheck_method: 'saslauthd') }
    end
  end
end
