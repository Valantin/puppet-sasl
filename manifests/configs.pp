# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include sasl::configs
class sasl::configs (
  Hash $config = undef,
) {
  create_resources('sasl::config', $config, {})
}
