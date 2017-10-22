#
# == Class: easyrsa3::config
#
# Configure easy-rsa
#
class easyrsa3::config
(
    Integer $key_size,
    Integer $ca_expire,
    Integer $cert_expire
)
{

    $basedir = '/opt/easy-rsa/easyrsa3'

    # Ensure a vars file is present
    file { "${basedir}/vars":
        ensure  => 'present',
        owner   => $::os::params::adminuser,
        group   => $::os::params::admingroup,
        mode    => '0644',
        content => template('easyrsa3/vars.erb'),
        require => Class['::easyrsa3::install'],
    }

    Exec {
        cwd  => $basedir,
        path => [ $basedir, '/bin', '/usr/bin', '/usr/local/bin' ]
    }

    # Initialize the PKI if it is not present
    exec { 'init-pki':
        command => 'easyrsa init-pki',
        creates => "${basedir}/pki",
        require => File["${basedir}/vars"], 
    }
}
