define cleanup::bynumber (
  $hour          = $::cleanup::hour,
  $minute        = $::cleanup::minute,
  $number_left   = $::cleanup::number_left,
  $pattern       = $::cleanup::pattern,
  $ensure        = $::cleanup::ensure,

) {
  if ! $pattern {
    fail( 'a pattern MUST be set for the cleanup entry' )
  }

  cron { $title:
      command => "ls -1drt $pattern | head -n -$number_left | xargs -t -i rm -r {}",
      user => root,
      hour => $hour,
      minute => $minute,
      ensure => $ensure,
    }
}
