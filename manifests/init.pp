#
# == Class: easyrsa3
#
# Setup easyrsa3
#
# Note that this module also manages the vars file and sets mode to cn_only. 
# Config management can be disabled with $manage_config = false.
#
# == Parameters
#
# [*manage*]
#   Whether to manage postfix with Puppet or not. Valid values are true
#   (default) and false.
# [*manage_config*]
#   Manage easy-rsa configuration with Puppet. Valid values are true (default) 
#   and false.
# [*key_size*]
#   Keysize, defaults to 2048.
# [*ca_expire*]
#   Number of days before the CA expires. Defaults to 3650 (10 years).
# [*cert_expire*]
#   Default expiration time in days for certificates. Defaults to 365 (1 year).
#
class easyrsa3
(
    Boolean $manage = true,
    Boolean $manage_config = true,
    Integer $key_size = 2048,
    Integer $ca_expire = 3650,
    Integer $cert_expire = 365
)
{
if $manage {
    include ::easyrsa3::install

    class { '::easyrsa3::config':
        key_size    => $key_size,
        ca_expire   => $ca_expire,
        cert_expire => $cert_expire,
    }
}
}
