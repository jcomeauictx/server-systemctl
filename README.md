# server-systemctl

User systemd configuration for dedicated servers or beefy VPSs.

Also contains systemd configuration for laptops and netbooks, some of which
use remote servers for services; see smtp.service for example. For these, you
will need `server` defined in either /etc/hosts or ~/.ssh/config. Examples:

    /etc/hosts:

    10.234.3.7 server

    ~/.ssh/config:

    Host server
    HostName 10.234.3.7
    User myusername

Obviously, if your remote username is not the same as that on your portable
computer, you will need at least the Host and User stanzas in ~/.ssh/config
regardless of an entry in /etc/hosts.
