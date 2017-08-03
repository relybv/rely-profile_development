# == Class profile_development::params
#
# This class is meant to be called from profile_development.
# It sets variables according to platform.
#
class profile_development::params {
  case $::operatingsystem {
    'FreeBSD': {
      $devuser = 'centos'
      $packages = ['git', 'rubygem-bundler', 'ruby-devel', 'unzip', 'wget']
    }
    'Debian': {
      $devuser = 'debian'
      $packages = ['ruby2.3', 'ruby2.3-dev', 'git' ,'bundler', 'unzip','awscli', 'python-novaclient', 'python-neutronclient', 'python-glanceclient']
    }
    'Ubuntu': {
      $devuser = 'ubuntu'
      $packages = ['ruby2.3', 'ruby2.3-dev', 'git' ,'bundler', 'unzip','awscli', 'python-novaclient', 'python-neutronclient', 'python-glanceclient']
    }
    'CentOS': {
      $devuser = 'centos'
      $packages = ['git','epel-release' ,'rubygem-bundler', 'ruby-devel', 'unzip', 'wget']
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
