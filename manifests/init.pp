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
  $package_name   = $::ntp::params::package_name,
  $package_ensure = $::ntp::params::package_ensure,
  $service_name   = $::ntp::params::service_name,
  $service_ensure = $::ntp::params::service_ensure,
  $servers        = $::ntp::params::servers,
) inherits ::ntp::params {

  # validate parameters here

  class { '::ntp::install': } ->
  class { '::ntp::config': } ~>
  class { '::ntp::service': } ->
  Class['::ntp']
}
