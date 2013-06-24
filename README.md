# clean 

Setup crontab jobs which will periodically:
+ remove `files` from a location (or by pattern) which were modified before certain period.
+ remove `files` from a location (or by pattern) leaving an specified amount of them untouched.
+ blank individual `files`.


To use simply declare a hash for each file or path pattern you need to remove:

## Installation

This module will only require `cron` to be present at the target host. 

## Configuration

The following is an example of how this module can be used:

    classes:
      - cleanup

    cleanup::entries::bytime
      mylog-files:
        hour:          *
        minute:        10
        last_modified: 5
        pattern:       "/var/logs/myapp/mylog-*"
        ensure:        present
    cleanup::entries::bynumber
      myother-files:
        hour:          *
        minute:        11
        number_left : 5
        pattern:       "/var/logs/myapp/myotherlogs-*"
        ensure:        present
    cleanup::entries::blank
      access-files:
        hour:          *
        minute:        11
        file_path:     "/var/logs/myapp/myapp-access.log"
        ensure:        present
      

### Parameters

#### bytime
*hour*: `cron-style` hour component for the scheduling
*minute*: `cron-style` minute component for the scheduling 
*last_modified*: this indicates how many `days` worth of files should be left out of the cleanup operation
*pattern*: path pattern of the files to removed.
*ensure*: indicate whether the cleanup entry/crontab should be present on the target host


#### bynumber
*hour*: `cron-style` hour component for the scheduling
*minute*: `cron-style` minute component for the scheduling
*number_left*: this indicates how many files should be left out of the cleanup operation
*pattern*: path pattern of the files to removed.
*ensure*: indicate whether the cleanup entry/crontab should be present on the target host


#### blank
*hour*: `cron-style` hour component for the scheduling
*minute*: `cron-style` minute component for the scheduling
*file_path*: path to the file to be "blanked-out".
*ensure*: indicate whether the cleanup entry/crontab should be present on the target host


## Limitations

+ Cleanups can only be scheduled to run daily or more frequentlly.
+ Removal of an entry must be performed by setting it `ensure` attribute to `absent`
+ "blanking-out" log files only work with individual files.

## Support

License: Apache License, Version 2.0

