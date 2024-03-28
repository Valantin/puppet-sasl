# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @param service
#   Service name os the saslauthd daemon
#   Default 'saslauthd'
#
# @param package
#   Default 'sasl2-bin'
#
# @param config
#
# @example
#   include sasl::services
class sasl::service (
  String $service = 'saslauthd',
  String $package = 'sasl2-bin',
  Sasl::Mechanism $mechanism = 'ldap',
  String $mech_options = '',
  Integer $threads = 5,
  Array[String] $options = ['-c'],
  Stdlib::Absolutepath $socket,
  Stdlib::Absolutepath $config,
) {
  package { $package:
    ensure => present,
  }
  -> sasl::config { $service:
    mechanism    => $mechanism,
    mech_options => $mech_options,
    threads      => $threads,
    socket       => $socket,
    options      => $options,
    config       => $config,
  }
  -> service { $service:
    ensure => running,
    enable => true,
  }
}
