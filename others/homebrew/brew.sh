#!/usr/bin/env sh

# Install Homebrew (https://brew.sh/)
brew help || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update

brew install cmatrix                                              # Terminal based "The Matrix" like implementation (https://github.com/abishekvashok/cmatrix)
brew install cowsay                                               # Let the cow talk (https://github.com/schacon/cowsay)
brew install figlet                                               # FIGlet is a program for making large letters out of ordinary text (http://www.figlet.org/)
brew install fortune                                              # Fortune CLI (https://gist.github.com/zlorb/4a3eff8981fcec8ca1c7)
brew install htop                                                 # Htop is an interactive text-mode process viewer for Unix systems. It aims to be a better 'top' (https://github.com/hishamhm/htop)
brew install lolcat                                               # Rainbows and unicorns (https://github.com/busyloop/lolcat)
brew install terminal-notifier                                    # Send User Notifications on macOS from the command-line (https://github.com/julienXX/terminal-notifier)
brew install tmux                                                 # tmux source code (https://github.com/tmux/tmux)
brew install zsh                                                  # Zsh is a shell designed for interactive use (http://www.zsh.org/)
brew cask install google-chrome                                   # Google Chrome Browser (https://www.google.com/intl/en_in/chrome/)
#brew cask install graphiql                                        # GraphiQL & the GraphQL LSP Reference Ecosystem for building browser & IDE tools (https://github.com/graphql/graphiql)
#brew cask install hyper                                           # A terminal built on web technologies (https://github.com/zeit/hyper)
#brew cask install keycastr                                        # KeyCastr, an open-source keystroke visualizer (https://github.com/keycastr/keycastr)
#brew cask install motrix                                          # A full-featured download manager (https://github.com/agalwood/Motrix)
#brew cask install qutebrowser                                     # A keyboard-driven, vim-like browser based on PyQt5 (https://github.com/qutebrowser/qutebrowser)
#brew cask install typora                                          # Markdown Reader (https://github.com/typora/)
#brew cask install vlc                                             # VLC media player (https://github.com/videolan/vlc)
#brew cask install vscodium                                        # Binary releases of VS Code without MS branding/telemetry/licensing (https://github.com/VSCodium/vscodium)
#brew install php@7.3; brew install libidn2; brew install libpsl;  # The PHP Interpreter (https://github.com/php/php-src)
#brew tap heroku/brew && brew install heroku                       # Heroku CLI (https://github.com/heroku/cli)
#brew tap homebrew/cask-fonts                                      # Cask of Fonts (https://github.com/Homebrew/homebrew-cask-fonts)
#brew cask install font-fira-code                                  # Monospaced font with programming ligatures (https://github.com/tonsky/FiraCode)
#brew cask install font-fontawesome                                # The iconic SVG, font, and CSS toolkit (https://github.com/FortAwesome/Font-Awesome)
terminal-notifier -title 'Installing' -message 'Brew apps have been installed.'

# Cleanup for Homebrew (https://brew.sh/)
brew cleanup
terminal-notifier -title 'Installing' -message 'Brew has been cleaned.'
