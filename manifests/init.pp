# == Class: ntp
#
# Full description of class ntp here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class ntp (
  $package_name = $::ntp::params::package_name,
  $service_name = $::ntp::params::service_name,
) inherits ::ntp::params {

  # validate parameters here

  class { '::ntp::install': } ->
  class { '::ntp::config': } ~>
  class { '::ntp::service': } ->
  Class['::ntp']
}
