# == Class profile_development::install
#
# This class is called from profile_development for install.
#
class profile_development::install {
  # prevent direct use of subclass
  if $caller_module_name != $module_name {
    fail("Use of private class ${name} by ${caller_module_name}")
  }

  ensure_packages( $profile_development::packages )

  class {'::ansible': }

  if $::osfamily == 'debian' {
    # add ruby repository
    include apt
    apt::ppa { 'ppa:brightbox/ruby-ng':
      before => Package['ruby2.3', 'ruby2.3-dev'],
    }
  }

  if $::osfamily != 'FreeBSD' {
    include hashicorp
    class { 'hashicorp::terraform':
      version => '0.9.10',
    }
  }
}
