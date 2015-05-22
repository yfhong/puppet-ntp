# == Class ntp::params
#
# This class is meant to be called from ntp.
# It sets variables according to platform.
#
class ntp::params {

  # default package name and ensured status.
  $package_name = ['ntp', 'ntpdate']
  $package_ensure = 'present'

  # default service setting.
  $service_name = 'ntpd'
  $service_ensure = 'running'

  ## global parameters
  $root_group = $::operatingsystem ? {
    /(FreeBSD|Solaris)/ => 'wheel',
    default             => 'root',
  }

  # default base config directory and file
  $conffile = '/etc/ntp.conf'

  $servers = []

  case $::operatingsystem {
    'Debian', 'Ubuntu',
    'RedHat', 'CentOS',
    'Amazon': {
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
