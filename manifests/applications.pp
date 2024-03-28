# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @param applications
#   Hash that contain the application configuration
# @example
#   include sasl::applications
class sasl::applications (
  Hash $applications = {},
) {
  create_resources('sasl::application', $applications, {})
}
