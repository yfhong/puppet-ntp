# == Class ntp::service
#
# This class is meant to be called from ntp.
# It ensure the service is running.
#
class ntp::service {

  service { 'ntp':
    name       => $::ntp::service_name,
    ensure     => $::ntp::service_ensure,
    enable     => $::ntp::service_ensure ? {
      'running' => true,
      'stopped' => false,
    },
    hasstatus  => true,
    hasrestart => true,
  }
}
