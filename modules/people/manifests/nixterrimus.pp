class people::nixterrimus {
  $HOME = "/Users/${::boxen_user}"

  repository { 'homeshick':
    source => 'andsens/homeshick',
    path   => "${HOME}/.homesick/repos/homeshick"
  }

  include zsh

  # Janus Setup
  include macvim
  include vim-janus
}
