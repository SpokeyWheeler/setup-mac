#!/bin/bash

cp files/.p10k.zsh ~
cp files/*.ttf ~/Library/Fonts

echo "Setting up git"
git config --global user.email "spokeymon@hotmail.com"
git config --global user.name "Spokey"

if [ ! -d ~/.ssh ]
then
	echo "Setting up .ssh"
	mkdir -p ~/.ssh
	cd ~/.ssh || return
fi

mkdir -p ~/workspace

echo "Setting up basic .zshrc"
echo -n > ~/.zshrc
echo "source ~/.iterm2_shell_integration.zsh" >> ~/.zshrc
echo 'iterm2_print_user_vars() {
  iterm2_set_user_var shortPath $( pwd | sed "s/\/Users\/spokey/~/" )
}' >> ~/.zshrc
echo "export GOPATH=~/go" >> ~/.zshrc
echo "export GOBIN=$GOPATH/bin" >> ~/.zshrc
echo "export PATH=/Applications/MacVim.app/Contents/bin:$PATH:~/homebrew/bin:/Users/spokey/Library/Python/3.9/bin:~/.release/bin:$GOBIN" >> ~/.zshrc

echo '
alias l="ls -l"
alias ll="ls -la"
alias la="ls -la"
alias gco="git checkout"
alias gcl="git clone"
alias gpl="git pull"
alias grm="git rebase master"
alias gps="git push"
alias gcm="git commit -m"
alias gaa="git add --all"
alias gs="git status"
alias kctx=kubectx
alias kns=kubens
alias k=kubectl
' >> ~/.zshrc

echo "Setting up homebrew"
cd ~
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

#eval "$(homebrew/bin/brew shellenv)"
brew update --force --quiet
#chmod -R go-w "$(brew --prefix)/share/zsh"

brew install node
brew install fzf
#/homebrew/opt/fzf/install --all
brew install jq
brew install k9s
brew install stern
brew install shellcheck
brew install romkatv/powerlevel10k/powerlevel10k
#echo "source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme" >> ~/.zshrc
echo "source ~/.p10k.zsh" >> ~/.zshrc
echo "set -o vi" >> ~/.zshrc

defaults write com.googlecode.iterm2 "New Bookmarks" -array '(
        {
        "ASCII Anti Aliased" = 1;
        "ASCII Ligatures" = 1;
        "AWDS Pane Directory" = "";
        "AWDS Pane Option" = No;
        "AWDS Tab Directory" = "";
        "AWDS Tab Option" = No;
        "AWDS Window Directory" = "";
        "AWDS Window Option" = No;
        "Allow Title Reporting" = 1;
        "Ambiguous Double Width" = 0;
        "Ansi 0 Color" =         {
            "Blue Component" = 0;
            "Green Component" = 0;
            "Red Component" = 0;
        };
        "Ansi 1 Color" =         {
            "Blue Component" = 0;
            "Green Component" = 0;
            "Red Component" = "0.7333333492279053";
        };
        "Ansi 10 Color" =         {
            "Blue Component" = "0.3333333432674408";
            "Green Component" = 1;
            "Red Component" = "0.3333333432674408";
        };
        "Ansi 11 Color" =         {
            "Blue Component" = "0.3333333432674408";
            "Green Component" = 1;
            "Red Component" = 1;
        };
        "Ansi 12 Color" =         {
            "Blue Component" = 1;
            "Green Component" = "0.3333333432674408";
            "Red Component" = "0.3333333432674408";
        };
        "Ansi 13 Color" =         {
            "Blue Component" = 1;
            "Green Component" = "0.3333333432674408";
            "Red Component" = 1;
        };
        "Ansi 14 Color" =         {
            "Blue Component" = 1;
            "Green Component" = 1;
            "Red Component" = "0.3333333432674408";
        };
        "Ansi 15 Color" =         {
            "Blue Component" = 1;
            "Green Component" = 1;
            "Red Component" = 1;
        };
        "Ansi 2 Color" =         {
            "Blue Component" = 0;
            "Green Component" = "0.7333333492279053";
            "Red Component" = 0;
        };
        "Ansi 3 Color" =         {
            "Blue Component" = 0;
            "Green Component" = "0.7333333492279053";
            "Red Component" = "0.7333333492279053";
        };
        "Ansi 4 Color" =         {
            "Blue Component" = "0.7333333492279053";
            "Green Component" = 0;
            "Red Component" = 0;
        };
        "Ansi 5 Color" =         {
            "Blue Component" = "0.7333333492279053";
            "Green Component" = 0;
            "Red Component" = "0.7333333492279053";
        };
        "Ansi 6 Color" =         {
            "Blue Component" = "0.7333333492279053";
            "Green Component" = "0.7333333492279053";
            "Red Component" = 0;
        };
        "Ansi 7 Color" =         {
            "Blue Component" = "0.7333333492279053";
            "Green Component" = "0.7333333492279053";
            "Red Component" = "0.7333333492279053";
        };
        "Ansi 8 Color" =         {
            "Blue Component" = "0.3333333432674408";
            "Green Component" = "0.3333333432674408";
            "Red Component" = "0.3333333432674408";
        };
        "Ansi 9 Color" =         {
            "Blue Component" = "0.3333333432674408";
            "Green Component" = "0.3333333432674408";
            "Red Component" = 1;
        };
        "BM Growl" = 1;
        "Background Color" =         {
            "Blue Component" = 0;
            "Green Component" = 0;
            "Red Component" = 0;
        };
        "Background Image Location" = "";
        "Badge Color" =         {
            "Alpha Component" = "0.5299530029296875";
            "Blue Component" = "0.687896728515625";
            "Color Space" = sRGB;
            "Green Component" = 1;
            "Red Component" = 0;
        };
        "Badge Font" = "MesloLGS-NF-Bold";
        "Badge Max Height" = "0.2";
        "Badge Max Width" = "0.5";
        "Badge Right Margin" = 10;
        "Badge Text" = "\\\\(hostname)";
        "Badge Top Margin" = 10;
        "Blinking Cursor" = 1;
        Blur = 1;
        "Bold Color" =         {
            "Blue Component" = 1;
            "Green Component" = 1;
            "Red Component" = 1;
        };
        "Character Encoding" = 4;
        "Close Sessions On End" = 1;
        Columns = 80;
        Command = "";
        "Cursor Color" =         {
            "Blue Component" = "0.7333333492279053";
            "Green Component" = "0.7333333492279053";
            "Red Component" = "0.7333333492279053";
        };
        "Cursor Text Color" =         {
            "Blue Component" = 1;
            "Green Component" = 1;
            "Red Component" = 1;
        };
        "Custom Command" = No;
        "Custom Directory" = Yes;
        "Custom Tab Title" = "";
        "Custom Window Title" = "\\\\(number)";
        "Default Bookmark" = No;
        Description = Default;
        "Disable Window Resizing" = 1;
        "Draw Powerline Glyphs" = 1;
        "Flashing Bell" = 1;
        "Foreground Color" =         {
            "Blue Component" = "0.7333333492279053";
            "Green Component" = "0.7333333492279053";
            "Red Component" = "0.7333333492279053";
        };
        Guid = "B0D7C011-1C45-46E7-BA97-9BAEA9534168";
        "Horizontal Spacing" = 1;
        Icon = 1;
        "Idle Code" = 0;
        "Jobs to Ignore" =         (
            rlogin,
            ssh,
            slogin,
            telnet
        );
        "Keyboard Map" =         {
            "0x2d-0x40000" =             {
                Action = 11;
                Text = 0x1f;
            };
            "0x32-0x40000" =             {
                Action = 11;
                Text = 0x00;
            };
            "0x33-0x40000" =             {
                Action = 11;
                Text = 0x1b;
            };
            "0x34-0x40000" =             {
                Action = 11;
                Text = 0x1c;
            };
            "0x35-0x40000" =             {
                Action = 11;
                Text = 0x1d;
            };
            "0x36-0x40000" =             {
                Action = 11;
                Text = 0x1e;
            };
            "0x37-0x40000" =             {
                Action = 11;
                Text = 0x1f;
            };
            "0x38-0x40000" =             {
                Action = 11;
                Text = 0x7f;
            };
            "0xf700-0x220000" =             {
                Action = 10;
                Text = "[1;2A";
            };
            "0xf700-0x240000" =             {
                Action = 10;
                Text = "[1;5A";
            };
            "0xf700-0x260000" =             {
                Action = 10;
                Text = "[1;6A";
            };
            "0xf700-0x280000" =             {
                Action = 11;
                Text = "0x1b 0x1b 0x5b 0x41";
            };
            "0xf701-0x220000" =             {
                Action = 10;
                Text = "[1;2B";
            };
            "0xf701-0x240000" =             {
                Action = 10;
                Text = "[1;5B";
            };
            "0xf701-0x260000" =             {
                Action = 10;
                Text = "[1;6B";
            };
            "0xf701-0x280000" =             {
                Action = 11;
                Text = "0x1b 0x1b 0x5b 0x42";
            };
            "0xf702-0x220000" =             {
                Action = 10;
                Text = "[1;2D";
            };
            "0xf702-0x240000" =             {
                Action = 10;
                Text = "[1;5D";
            };
            "0xf702-0x260000" =             {
                Action = 10;
                Text = "[1;6D";
            };
            "0xf702-0x280000" =             {
                Action = 11;
                Text = "0x1b 0x1b 0x5b 0x44";
            };
            "0xf703-0x220000" =             {
                Action = 10;
                Text = "[1;2C";
            };
            "0xf703-0x240000" =             {
                Action = 10;
                Text = "[1;5C";
            };
            "0xf703-0x260000" =             {
                Action = 10;
                Text = "[1;6C";
            };
            "0xf703-0x280000" =             {
                Action = 11;
                Text = "0x1b 0x1b 0x5b 0x43";
            };
            "0xf704-0x20000" =             {
                Action = 10;
                Text = "[1;2P";
            };
            "0xf705-0x20000" =             {
                Action = 10;
                Text = "[1;2Q";
            };
            "0xf706-0x20000" =             {
                Action = 10;
                Text = "[1;2R";
            };
            "0xf707-0x20000" =             {
                Action = 10;
                Text = "[1;2S";
            };
            "0xf708-0x20000" =             {
                Action = 10;
                Text = "[15;2~";
            };
            "0xf709-0x20000" =             {
                Action = 10;
                Text = "[17;2~";
            };
            "0xf70a-0x20000" =             {
                Action = 10;
                Text = "[18;2~";
            };
            "0xf70b-0x20000" =             {
                Action = 10;
                Text = "[19;2~";
            };
            "0xf70c-0x20000" =             {
                Action = 10;
                Text = "[20;2~";
            };
            "0xf70d-0x20000" =             {
                Action = 10;
                Text = "[21;2~";
            };
            "0xf70e-0x20000" =             {
                Action = 10;
                Text = "[23;2~";
            };
            "0xf70f-0x20000" =             {
                Action = 10;
                Text = "[24;2~";
            };
            "0xf729-0x20000" =             {
                Action = 10;
                Text = "[1;2H";
            };
            "0xf729-0x40000" =             {
                Action = 10;
                Text = "[1;5H";
            };
            "0xf72b-0x20000" =             {
                Action = 10;
                Text = "[1;2F";
            };
            "0xf72b-0x40000" =             {
                Action = 10;
                Text = "[1;5F";
            };
        };
        "Minimum Contrast" = 0;
        "Mouse Reporting" = 1;
        Name = Default;
        "Non Ascii Font" = "MesloLGS-NF-Regular 12";
        "Non-ASCII Anti Aliased" = 1;
        "Normal Font" = "MesloLGS-NF-Regular 12";
        "Only The Default BG Color Uses Transparency" = 1;
        "Open Toolbelt" = 0;
        "Option Key Sends" = 0;
        "Prevent Opening in a Tab" = 0;
        "Prompt Before Closing 2" = 0;
        "Right Option Key Sends" = 0;
        Rows = 25;
        Screen = "-1";
        "Scrollback Lines" = 0;
        "Selected Text Color" =         {
            "Blue Component" = 0;
            "Green Component" = 0;
            "Red Component" = 0;
        };
        "Selection Color" =         {
            "Blue Component" = 1;
            "Green Component" = "0.8353000283241272";
            "Red Component" = "0.7098000049591064";
        };
        "Send Code When Idle" = 0;
        Shortcut = "";
        "Show Timestamps" = 1;
        "Silence Bell" = 0;
        Space = 0;
        "Sync Title" = 0;
        Tags =         (
        );
        "Terminal Type" = "xterm-256color";
        "Title Components" = 4;
        Transparency = "0.01";
        Triggers =         (
        );
        "Unlimited Scrollback" = 1;
        "Use Bold Font" = 1;
        "Use Bright Bold" = 1;
        "Use Custom Tab Title" = 0;
        "Use Custom Window Title" = 1;
        "Use Italic Font" = 1;
        "Use Non-ASCII Font" = 0;
        "Vertical Spacing" = 1;
        "Visual Bell" = 1;
        "Window Type" = 0;
        "Working Directory" = "/Users/william.wheeler/workspace";
    }
)'

defaults write com.googlecode.iterm2 PromptOnQuit -bool false

cd ~

curl -L https://iterm2.com/shell_integration/zsh -o ~/.iterm2_shell_integration.zsh

echo "Done!"
