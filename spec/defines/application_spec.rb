# frozen_string_literal: true

require 'spec_helper'

describe 'sasl::application' do
  let(:title) { 'slapd' }
  let(:pre_condition) do
    "class {'sasl::service': }"
  end
  let(:params) do
    {
      mech_list: ['gssapi','plain','external'],
      pwcheck_method: 'saslauthd',
    }
  end

  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }
      it { is_expected.to contain_sasl__application('slapd').with(pwcheck_method: 'saslauthd') }
    end
  end
end
