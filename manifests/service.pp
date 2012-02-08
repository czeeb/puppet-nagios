class nagios::service {
	nagios::service::servicegroups { [
		"apt",
		"disks",
		"interfaces",
		"kernel",
		"libs",
		"load",
		"mailq",
		"ntp",
		"procs",
		"puppet",
		"smart",
		"ssh",
		"swap",
		"user" ]:
	}

	Nagios_service <<||>> {
		notify  => Exec["fix-permissions"],
		require => File["conf.d"],
	}

	Nagios_servicegroup <||> {
		notify  => Exec["fix-permissions"],
		require => File["conf.d"],
	}
}

# vim: tabstop=3