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
# @param mechanism
#   Backend for saslauth service
#   Default 'ldap'
#
# @param mech_options
#   Additionaly -O option to sasl2-bin
#
# @param threads
#   Number of process running
#   Default 5
#
# @param options
#   Other extra options to pass to sasl2-bin
#   Default ['-c']
#
# @param socket
#   Socket path used by daemon
#
# @param config
#   Config file to store env used by daemon
#
# @example
#   include sasl::services
class sasl::service (
  String $service = 'saslauthd',
  String $package = 'sasl2-bin',
  Sasl::Mechanism $mechanism = 'ldap',
  String $mech_options = '', #lint:ignore:params_empty_string_assignment
  Integer $threads = 5,
  Array[String] $options = ['-c'],
  Stdlib::Absolutepath $socket = undef,
  Stdlib::Absolutepath $config = undef,
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
