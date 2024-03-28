# @summary A short summary of the purpose of this defined type.
#
# A description of what this defined type does
#
# @example
#   sasl::config { 'namevar': }
define sasl::config (
  Sasl::Mechanism $mechanism = 'ldap',
  String $mech_options = '', #lint:ignore:params_empty_string_assignment
  Integer $threads = 5,
  Stdlib::Absolutepath $socket = undef,
  Array[String] $options = ['-c'],
  Stdlib::Absolutepath $config = $name,
) {
  case $facts['os']['family'] {
    'Debian': {
      $_options = $options << "-m ${socket}"
      shellvar { 'NAME':
        target => $config,
        value  => $name,
      }
      shellvar { 'MECHANISM':
        target => $config,
        value  => $mechanism,
      }
      shellvar { 'MECH_OPTIONS':
        target => $config,
        value  => $mech_options,
      }
      shellvar { 'THREADS':
        target => $config,
        value  => $threads,
      }
      shellvar { 'OPTIONS':
        target => $config,
        value  => $_options.join(' '),
      }
    }
    'RedHat': {
      $_options = $options << "-O ${mech_options}" << "-n ${threads}"
      shellvar { 'SOCKETDIR':
        target => $config,
        value  => $socket,
      }
      shellvar { 'FLAGS':
        target => $config,
        value  => $_options.join(' '),
      }
      shellvar { 'MECH':
        target => $config,
        value  => $mechanism,
      }
    }
    default: {
      fail("unsupported Operating System ${facts}['os']['family']")
    }
  }
}
