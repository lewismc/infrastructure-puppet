#/etc/puppet/modules/manifests/ssl/name/bz_apache_org.pp

class ssl::name::bz_apache_org (

  $sslcertcontents     = '',
  $sslcertname         = 'bz.apache.org.crt',
  $sslchaincontent     = '',
  $sslchainname        = 'bz.apache.org.chain',
  $sslkeycontents      = '',
  $sslkeyname          = 'bz.apache.org.key',
  $sslcombinedcontents = '',
  $sslcombinedname     = 'bz.apache.org-combined.cert',
  $sslrootdir          = '/etc/ssl',
  $sslrootdirgroup     = 'root',
  $sslrootdirowner     = 'root',
  $sslrootdirumask     = '0755',
) {

  file {
    $sslrootdir:
      ensure => directory,
      group  => $sslrootdirgroup,
      owner  => $sslrootdirowner,
      mode   => $sslrootdirumask;
    "${sslrootdir}/certs":
      ensure => directory,
      group  => $sslrootdirgroup,
      owner  => $sslrootdirowner,
      mode   => '0755';
    "${sslrootdir}/private":
      ensure => directory,
      group  => $sslrootdirgroup,
      owner  => $sslrootdirowner,
      mode   => '0700';
    "${sslrootdir}/certs/${sslcertname}":
      ensure  =>  present,
      require => File[$sslrootdir],
      content => $sslcertcontents,
      owner   => $sslrootdirowner,
      group   => $sslrootdirgroup;
    "${sslrootdir}/private/${sslkeyname}":
      ensure  =>  present,
      require => File[$sslrootdir],
      content => $sslkeycontents,
      owner   => $sslrootdirowner,
      group   => $sslrootdirgroup;
    "${sslrootdir}/certs/${sslchainname}":
      ensure  =>  present,
      require => File[$sslrootdir],
      content => $sslchaincontent,
      owner   => $sslrootdirowner,
      group   => $sslrootdirgroup;
    "${sslrootdir}/private/${sslcombinedname}":
      ensure  =>  present,
      require => File[$sslrootdir],
      content => $sslcombinedcontents,
      owner   => $sslrootdirowner,
      group   => $sslrootdirgroup;
  }
}
