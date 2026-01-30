#Alias
alias ls="lsd -alh --group-dirs=first --icon=always"
co() { g++ -std=c++17 -O2 -o "${1%.*}" $1 -Wall; }
run() { co $1 && ./${1%.*} & fg; }
alias cdd="cd ~/developer"
alias vim="nvim"
alias g++="g++-15"
alias killport='f(){ lsof -ti :$1 | xargs -r kill -9; }; f'
# Use z instead of cd, but don't ruin muscle memory
alias cd='z'
alias ssh="kitty +kitten ssh"


kittytheme() {
  cd ~/.config/kitty || return
  rm -f theme.conf
  ln -s "./kitty-themes/themes/$1.conf" theme.conf
}


#Bandit Alias
bandit() {
    ssh "bandit$1@bandit.labs.overthewire.org" -p 2220
}
#   echo "\033[3m\e[32mThree Rings for the Elven-kings under the sky,
# Seven for the Dwarf-lords in their halls of stone,
# Nine for Mortal Men doomed to die,
# One for the Dark Lord on his dark throne
# In the Land of Mordor where the Shadows lie.
#  One Ring to rule them all, One Ring to find them,
#  One Ring to bring them all, and in the darkness bind them
# In the Land of Mordor where the Shadows lie.\033[0m"

#  echo "\033[3m\e[33mI must not fear. Fear is the mind-killer. Fear is the little-death that brings total obliteration. I will face my fear.\033[0m"
# #programs to run at start 


#Stuff I no longer understand. 

#PATH variables
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin
export PATH="/Library/TeX/texbin:$PATH"
export PATH=$HOME/developer/flutter/bin:$PATH
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export PATH="$PATH:/Users/zain/Library/Python/3.9/bin"
export PATH=$PATH:/path/to/z3/bin


## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /Users/zain/.dart-cli-completion/zsh-config.zsh ]] && . /Users/zain/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
alias fishing='cd ~/Developer/macro && source .venv/bin/activate && python fishing.py'
source ~/powerlevel10k/powerlevel10k.zsh-theme
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
eval "$(zoxide init zsh)"

export PATH="~/.local/bin:$PATH" 
export PATH="$HOME/.local/bin:$PATH"


[[ "$TERM_PROGRAM" == "kiro" ]] && . "$(kiro --locate-shell-integration-path zsh)"

eval "$(zoxide init zsh)"


# Turso
export PATH="$PATH:/Users/zain/.turso"
export PATH=$HOME/.local/bin:$PATH
export MANPATH=$HOME/.local/man:$MANPATH
docxtopdf() {
  local dir="${1:-.}"
  find "$dir" -type f -name '*.docx' -print0 | while IFS= read -r -d '' f; do
    local outdir
    outdir="$(dirname "$f")"
    soffice --headless --convert-to pdf --outdir "$outdir" "$f"
  done
}
