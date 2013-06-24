define cleanup::blank (
  $hour          = $::cleanup::hour,
  $minute        = $::cleanup::minute,
  $file_path     = $::cleanup::file_path,
  $ensure        = $::cleanup::ensure,

) {
  if ! $file_path {
    fail( 'a file_path MUST be set for the cleanup entry (blank cleanup)' )
  }

  cron { $title:
      command => "echo \"\" > $file_path",
      user => root,
      hour => $hour,
      minute => $minute,
      ensure => $ensure,
    }
}
