# == Class: cleanup
#
# Full description of class cleanup here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if it
#   has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should not be used in preference to class parameters  as of
#   Puppet 2.6.)
#
# === Examples
#
#  class { cleanup:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ]
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2013 Your name here, unless otherwise noted.
#


class cleanup (
  $hour   = 0,
  $minute = 30,
  $last_modified = 5,
  $number_left = 5,
  $file_path = undef,
  $pattern = undef,
  $ensure = absent,
){
  $bynumber = hiera_hash('cleanup::entries::bynumber', undef)
  if $bynumber {
    create_resources('cleanup::bynumber', $bynumber)
  }

  $bydate = hiera_hash('cleanup::entries::bydate', undef)
  if $bydate {
    create_resources('cleanup::bydate', $bydate)
  }

 $blank = hiera_hash('cleanup::entries::blank', undef)
  if $blank {
    create_resources('cleanup::blank', $blank)
  }

}
