define cleanup::entry (
  $hour          = $::cleanup::hour,
  $minute        = $::cleanup::minute,
  $last_modified = $::cleanup::last_modified,
  $pattern       = $::cleanup::pattern,
  $ensure        = $::cleanup::ensure,

) {
  if ! $pattern {
    fail( 'a pattern MUST be set for the cleanup entry' )
  }

  cron { $title:
      command => "find $pattern -mtime +$last_modified -exec rm -rf {} \;",
      user => root,
      hour => $hour,
      minute => $minute,
      ensure => $ensure,
    }
}
