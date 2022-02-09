
###################### macbook ######################
# softwareupdate --install-rosetta # intall rosetta in m1 mac
# sudo xattr -r -d com.apple.quarantine /Applications/xxxxx.app # force open app

###### Apple defaults command

### dock
# defaults write com.apple.dock show-recents -bool no # set show-recents to false
# defaults write com.apple.dock recent-apps -array # intentionally empty
# defaults write com.apple.dock persistent-others -array-add '{tile-data={}; tile-type="spacer-tile";}' # add space to dock
# killall Dock # restart dock and load changes

####  ApplePressAndHoldEnabled
# defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false         # For VS Code
# defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false # For VS Code Insider
# defaults write com.visualstudio.code.oss ApplePressAndHoldEnabled -bool false    # For VS Codium
# defaults delete -g ApplePressAndHoldEnabled                                      # If necessary, reset global default

### Hide specific App in dock
# /usr/libexec/PlistBuddy -c 'Add :LSUIElement bool true' /Applications/[AppName].app/Contents/Info.plist

### disable spelling and Grammar
# https://apple.stackexchange.com/questions/299470/how-to-permanently-turn-off-check-spelling-while-typing-in-macos

# Install Homebrew (https://brew.sh/)
brew help || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install stow tmux fzf alacritty # this command is just for CI test

# new macos setup should use below
# brew update
# brew bundle --file=.github/Brewfile

# https://github.com/junegunn/fzf#using-homebrew
# To install useful key bindings and fuzzy completion:
$(brew --prefix)/opt/fzf/install # config fzf
# p10k configure # config powerlevel10k