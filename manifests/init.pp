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
#
# The other variables affect easy-rsa's vars file directly and should be
# self-explanatory.
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
