class people::nixterrimus {
  $HOME = "/Users/${::boxen_user}"

  repository { 'homeshick':
    source => 'andsens/homeshick',
    path   => "${HOME}/.homesick/repos/homeshick"
  }

  package {
    [
      'go',
      'jq',

      'wget'
    ]:
    ensure => present
  }

  # Janus Setup
  include macvim
  include vim-janus

  # OS X Setup
  include osx::global::key_repeat_rate
  include osx::global::key_repeat_delay
  include osx::dock::autohide
  include osx::finder::unhide_library
  include osx::finder::enable_quicklook_text_selection
  include osx::global::expand_print_dialog
  include osx::global::expand_save_dialog
  include osx::disable_app_quarantine

  class { 'osx::global::natural_mouse_scrolling':
    enabled => false
  }
  class { 'osx::dock::icon_size':
    size => 30
  }

  # OS X Apps
  include brewcask

  package { 'google-chrome': provider => 'brewcask' }
  package { 'adium': provider => 'brewcask' }
  package { 'alfred': provider => 'brewcask' }

  # Someday this might not be the right choice
  #  then look into: https://github.com/sdegutis/hydra
  package { 'slate': provider => 'brewcask' }
  include hipchat

  # Git Config
  git::config::global {
    'user.name':
      value => 'Nick Rowe';
    'user.email':
      value => 'nixterrimus@dcxn.com';
    'github.user':
      value => 'nixterrimus';
  }
}
