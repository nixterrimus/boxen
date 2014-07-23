class people::nixterrimus {
  $HOME = "/Users/${::boxen_user}"

  repository { 'homeshick':
    source => 'andsens/homeshick',
    path   => "${HOME}/.homesick/repos/homeshick"
  }

  # Janus Setup
  include macvim
  repository { 'janus':
    source => 'carlhuda/janus',
    path   => "${home}/.vim",
  }
  ~> exec { 'Bootstrap Janus':
    command     => 'rake',
    cwd         => "${home}/.vim",
    refreshonly => true,
    environment => [
      "HOME=${home}",
    ],
  }
}
