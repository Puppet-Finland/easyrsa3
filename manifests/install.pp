#
# == Class: easyrsa3::install
#
# Install easyrsa3
#
class easyrsa3::install {

    ensure_resource('file', '/opt', { 'ensure' => 'directory' })

    vcsrepo { '/opt/easy-rsa':
        ensure   => 'present',
        provider => 'git',
        source   => 'https://github.com/OpenVPN/easy-rsa.git',
    }
}
