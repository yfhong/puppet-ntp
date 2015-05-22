# == Class ntp::params
#
# This class is meant to be called from ntp.
# It sets variables according to platform.
#
class ntp::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'ntp'
      $service_name = 'ntp'
    }
    'RedHat', 'Amazon': {
      $package_name = 'ntp'
      $service_name = 'ntp'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
