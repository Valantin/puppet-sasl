# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @param config
#   Hash that contain saslauthd daemon configuration
#
# @example
#   class { 'sasl::configs':
#     config => {
#       'saslauthd' => {
#         socket => '/var/run/saslauthd',
#         config => '/etc/default/saslauthd',
#       },
#     },
#   }
class sasl::configs (
  Hash $config = undef,
) {
  create_resources('sasl::config', $config, {})
}
