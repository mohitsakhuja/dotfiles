#!/usr/bin/env bash

# Check if Homebrew can be installed.
if [[ $OSTYPE != "darwin"* ]]; then
    echo -e "Environment not recognized as macOS.\nQuitting..."
    exit 1
fi

# Install Homebrew if it isn't installed already.
if ! [[ $(which brew) ]]; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo -e "Installation successful!\n"
fi

# Update Homebrew.
brew update

# Upgrade any previously installed packages.
brew upgrade

# Install/update Shell and its packages.
echo "Installing/updating Shell and its packages..."
bash $(pwd)/scripts/shell-packages.sh
echo -e "Done\n\n"

# Install Homebrew bundle.
brew tap Homebrew/bundle

# Install all packages specified in Brewfile.
brew bundle
echo -e "Packages installed successfully\n"

# Set up Perl correctly. Any other changes are in `.zshrc`.
PERL_MM_OPT="INSTALL_BASE=$HOME/perl5" cpan local::lib

# Install mas-cli for Mac App Store applications.
brew install mas

mas install 1365531024      # 1Blocker.
mas install 937984704       # Amphetamine.
mas install 1352778147      # Bitwarden.
mas install 595191960       # CopyClip.
# mas install 411643860       # DaisyDisk.
# mas install 1475897096      # Jira.
mas install 409183694       # Keynote.
# mas install 1480068668      # Messenger.
mas install 409203825       # Numbers.
mas install 823766827       # OneDrive.
mas install 409201541       # Pages.
mas install 1160374471      # PiPifier.
mas install 803453959       # Slack.
mas install 1153157709      # Speedtest.
# mas install 747648890       # Telegram.
mas install 425424353       # The Unarchiver.
# mas install 966085870       # TickTick.
# mas install 1482454543      # Twitter.
mas install 1284863847      # Unsplash Wallpapers.
mas install 1147396723      # WhatsApp Desktop.

# Remove outdated versions from the cellar.
echo "Doing some cleanup..."
brew cleanup
echo -e "Done\n"

# Install Node and its packages.
echo "Installing Node and its packages..."
bash $(pwd)/scripts/node-packages.sh
echo -e "Done\n\n"

# Install Python packages.
echo "Installing Python packages..."
bash $(pwd)/scripts/python-packages.sh
echo -e "Done\n\n"

# Install Ruby gems.
echo "Installing Ruby gems..."
bash $(pwd)/scripts/ruby-gems.sh
echo -e "Done\n\n"

# Install Vim packages.
echo "Installing Vim and its packages..."
bash $(pwd)/scripts/vim-packages.sh
echo -e "Done\n\n"
