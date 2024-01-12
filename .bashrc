# ~/.bashrc

# Terminal color
use_color=ture
force_color_prompt=yes

# Exports
export VISUAL=hx
export EDITOR="$VISUAL"
export TERM=xterm-256color

# Aliases
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias less='less --use-color'

alias bashrc='source ~/.bashrc'
alias lstime='date "+%I:%M%P"'
alias gui='startx &> ~/.xsession.log'

# Terminal prompt
LIGHT_BLUE="\e[1;34m"
LIGHT_GRAY="\e[0;37m"
END="\e[m"
PS1="${LIGHT_GRAY}---${END} ${LIGHT_BLUE}\A \u${END} ${LIGHT_GRAY}\w${END}\n${LIGHT_GRAY}-----${END} "

run () {
  ("$@" &>> ~/.xsession.log &)
}

nixos_switch () {
  CFG=$(realpath ${1})
  sudo nixos-rebuild switch -I nixos-config=${CFG}
}

dotfiles () {
  REPO=$(realpath -s ${1})

  ln_repo_home () {
    mkdir -p $(dirname ${HOME}/${2})
    ln -sf ${REPO}/${1} ${HOME}/${2}
  }
  
  ln_match_repo_home () {
    mkdir -p $(dirname ${HOME}/${1})
    ln -sf ${REPO}/${1} ${HOME}/${1}
  }

  ln_repo_home .bashrc .bash_profile
  
  ln_match_repo_home .bashrc
  ln_match_repo_home .xinitrc
  ln_match_repo_home .config/helix/config.toml
  ln_match_repo_home .config/i3/config
  ln_match_repo_home .config/alacritty/alacritty.yml
  ln_match_repo_home Pictures/woods.jpg
}
