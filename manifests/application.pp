# @summary A short summary of the purpose of this defined type.
#
# A description of what this defined type does
#
# @param application_file
#   file to save apllication specific configuration
#   Default "/usr/lib/sasl2/${name}.conf",
#
# @param authdaemon_path
#   Path to Courier-IMAP authdaemond’s unix socket.
#
# @param auto_transition
#   When set to ‘yes’ or ‘noplain’, and when using an auxprop plugin, automatically transition users to other mechs when they do a
#   successful plaintext authentication. When set to ‘noplain’, only non-plaintext secrets will be written. Note that the only mechanisms
#   (as currently implemented) which don’t use plaintext secrets are OTP, SCRAM and SRP.
#
# @param canon_user_plugin
#   Name of canon_user plugin to use
#
# @param log_level
#   Numeric Logging Level (see SASL_LOG_* in sasl.h for values and descriptions)
#
# @param mech_list
#   Whitespace separated list of mechanisms to allow (e.g. ‘plain otp’). Used to restrict the mechanisms to a subset of the installed
#   plugins.
#
# @param plugin_list
#   Location of Plugin list (Unsupported)
#
# @param pwcheck_method
#   Whitespace separated list of mechanisms used to verify passwords, used by sasl_checkpass. Possible values: ‘auxprop’, ‘saslauthd’,
#   ‘pwcheck’, ‘authdaemond’ [if compiled with –with-authdaemond]) and ‘alwaystrue’ [if compiled with –enable-alwaystrue])
#
# @param saslauthd_path
#   Path to saslauthd run directory (including the “/mux” named pipe)
#
# @param auxprop_plugin
#   Name of auxiliary plugin to use, you may specify a space-separated list of plugin names, and the plugins will be queried in order.
#
# @param keytab
#   Location of keytab file
#
# @param ccache_store
#   Location where cached credentials are stored, For example this could be FILE:/path/to/credstore/krb5cc_%U. Formatting options are:
#   %u UID of the logged in user (only valid for existing UNIX users) %U username of the logged in user %e EUID of the executing process
#   user %E username of the executing process user %p PID process ID of the executing process
#   Note that not all formatting options may not be available for all target environments. See the log files for indications in run-time.
#   If this option can not be parsed correctly credentials cache will fall-back to the contents of the KRB5CCNAME environment variable.
#   If this option is omitted, credentials delegation will not be enabled.
#   See MIT Kerberos documentation on more information about credentials cache storage.
#
# @param ad_compat
#   When set to ‘yes’, ‘on’, ‘1’ or ‘true’, a client will request both confidentiality and integrity when required by Active Directory.
#
# @param service_principal
#   Service principal to use when accepting a connection as a server. The principal name must be in GSS_C_NT_HOSTBASED_SERVICE form,
#   e.g. “someservice@someinstance” or “someservice”, or the string “*”, which causes the server to accept any valid principal present
#   in its keytab.
#
# @param ldapdb_uri
#   URI to the LDAP server. You can specify a space-separated list of URIs - ldapi:// or ldaps://ldap1/ ldaps://ldap2/
#
# @param ldapdb_id
#   ldap SASL authentication id
#
# @param ldapdb_mech
#   LDAP SASL mechanism for authentication.
#
# @param ldapdb_pw
#   LDAP password for SASL authentication id
#
# @param ldapdb_rc
#   The filename specified here will be put into the server’s LDAPRC environment variable, and libldap-specific config options may be set
#   in that ldaprc file.
#   The main purpose behind this option is to allow a client TLS certificate to be configured, so that SASL/EXTERNAL may be used between
#   the SASL server and the LDAP server. This is the most optimal way to use this plugin when the servers are on separate machines.
#
# @param ldapdb_starttls
#   Use StartTLS. This option may be set to ‘try’ or ‘demand’. When set to “try” any failure in StartTLS is ignored. When set to “demand”
#   then any failure aborts the connection.
#
# @param ldapdb_canon_attr
#   Use the value of the specified attribute as the user’s canonical name. The attribute will be looked up in the user’s LDAP entry. This
#   setting must be configured in order to use LDAPDB as a canonuser plugin.
#
# @param opiekeys
#   Location of the opiekeys file
#
# @param otp_mda
#   (Without opie) Message digest algorithm for one-time passwords, used by sasl_setpass
#
# @param sasldb_path
#   Path to sasldb file
#
# @param sasldb_mapsize
#   For sasldb with LMDB. Size of the memory map used by the DB. This is also the maximum possible size of the database, so it must be set
#   to a value large enough to contain all the desired user records.
#
# @param sasldb_maxreaders
#   For sasldb with LMDB. Maximum number of threads (or processes) that may concurrently read the database.
#
# @param sql_engine
#   Name of SQL engine to use (possible values: ‘mysql’, ‘pgsql’, ‘sqlite’, ‘sqlite3’).
#
# @param sql_hostnames
#   Comma separated list of SQL servers (in host[:port] format).
#
# @param sql_user
#   Username to use for authentication to the SQL server.
#
# @param sql_passwd
#   Password to use for authentication to the SQL server.
#
# @param sql_database
#   Name of the database which contains the auxiliary properties.
#
# @param sql_select
#   SELECT statement to use for fetching properties. This option is required in order to use the SQL plugin.
#
# @param sql_insert
#   INSERT statement to use for creating properties for new users.
#
# @param sql_update
#   UPDATE statement to use for modifying properties.
#
# @param srp_mda
#   Message digest algorithm for SRP calculations
#
# @param srvtab
#   Location of the srvtab file
#
# @example
#   sasl::application { 'namevar': }
define sasl::application (
  Stdlib::Absolutepath $application_file = "/usr/lib/sasl2/${name}.conf",
  Optional[Stdlib::Absolutepath] $authdaemon_path = undef,
  Optional[Enum['yes','noplain','no']] $auto_transition = undef,
  Optional[String] $canon_user_plugin = undef,
  Optional[Integer] $log_level = undef,
  Optional[Array[String]] $mech_list = undef,
  Optional[Stdlib::Absolutepath] $plugin_list = undef,
  Enum['auxprop','saslauthd','pwcheck','authdaemond','alwaystrue'] $pwcheck_method = 'auxprop',
  Optional[Stdlib::Absolutepath] $saslauthd_path = undef,
  Optional[Array[Variant[Enum['gssapi','ldapdb','otp','sasldb','sql','srp','kerberosv4'],String]]] $auxprop_plugin = undef,
  #gssapi
  Optional[Stdlib::Absolutepath] $keytab = undef,
  Optional[Stdlib::Absolutepath] $ccache_store = undef,
  Optional[Stdlib::Yes_no] $ad_compat = undef,
  Optional[String] $service_principal = undef, #[<GSS_C_NT_HOSTBASED_SERVICE> | *]
  #slapd
  Optional[Array[URI]] $ldapdb_uri = undef,
  Optional[String] $ldapdb_id = undef,
  Optional[Variant[Array[String],String]] $ldapdb_mech = undef,
  Optional[String] $ldapdb_pw = undef,
  Optional[String] $ldapdb_rc = undef,
  Optional[Enum['try','demand']] $ldapdb_starttls = undef,
  Optional[String] $ldapdb_canon_attr = undef,
  #OTP
  Optional[Stdlib::Absolutepath] $opiekeys = undef,
  Optional[Enum['md4','md5','sha1']] $otp_mda = undef,
  #sasldb
  Optional[Stdlib::Absolutepath] $sasldb_path = undef,
  Optional[Integer] $sasldb_mapsize = undef,
  Optional[Integer] $sasldb_maxreaders = undef,
  #sql
  Optional[Enum['mysql','pgsql','sqlite','sqlite3']] $sql_engine = undef,
  Optional[Array[URI]] $sql_hostnames = undef,
  Optional[String] $sql_user = undef,
  Optional[String] $sql_passwd = undef,
  Optional[String] $sql_database = undef,
  Optional[String] $sql_select = undef,
  Optional[String] $sql_insert = undef,
  Optional[String] $sql_update = undef,
  #SRP
  Optional[Enum['md5','sha1','smd160']] $srp_mda = undef,
  #kerberosv4
  Optional[Stdlib::Absolutepath] $srvtab = undef,
) {
  case $pwcheck_method {
    'auxprop': {
      case $auxprop_plugin {
        'gssapi': {
          $auxprop_plugin_package = 'libsasl2-modules-gssapi-mit'
        }
        'ldapdb': {
          $auxprop_plugin_package = 'libsasl2-modules-ldap'
        }
        'otp': {
          $auxprop_plugin_package = 'libsasl2-modules-otp'
        }
        'sasldb': {
          $auxprop_plugin_package = 'libsasl2-modules-db'
        }
        'sql': {
          $auxprop_plugin_package = 'libsasl2-modules-sql'
        }
        default: {
          $auxprop_plugin_package = 'libsasl2-modules'
        }
      }
      package { $auxprop_plugin_package:
        ensure => present,
      }
    }
    'saslauthd': {
      if ! defined(Class['sasl::service']) {
        fail('You must include the sasl::service class before using any sasl defined resources')
      }
    }
    'pwcheck': {
    }
    'authdaemond': {
    }
    'alwaystrue': {
    }
    default: {
    }
  }

  file { $application_file:
    owner   => 0,
    group   => 0,
    mode    => '0644',
    content => template("${module_name}/application.conf.epp"),
  }
}
