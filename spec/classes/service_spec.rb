# frozen_string_literal: true

require 'spec_helper'

describe 'sasl::service' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile.with_all_deps }
      it { is_expected.to contain_sasl__config('saslauthd').with(threads: 5) }
    end
  end
end
