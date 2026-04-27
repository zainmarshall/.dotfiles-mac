# ── PATH ──────────────────────────────────────────────────────────────────────
export PATH="$HOME/.local/bin:$PATH"
export MANPATH="$HOME/.local/man:$MANPATH"

if [[ "$OSTYPE" == "darwin"* ]]; then
    export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"
    export PATH="/Library/TeX/texbin:$PATH"
    export PATH="$HOME/Library/Python/3.9/bin:$PATH"
    export PATH="$HOME/.turso:$PATH"
fi

export PATH="$HOME/Developer/flutter/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# ── ALIASES ───────────────────────────────────────────────────────────────────
alias ls="lsd -a --group-dirs=first --icon=always"
alias lsa="lsd -alh --group-dirs=first --icon=always"
alias vim="nvim"
alias cdd="cd ~/Developer"

if [[ "$OSTYPE" == "darwin"* ]]; then
    alias g++="g++-15"
    [[ "$TERM" == "xterm-kitty" ]] && alias ssh="kitty +kitten ssh"
fi

# ── FUNCTIONS ─────────────────────────────────────────────────────────────────
co() { g++ -std=c++17 -O2 -o "${1%.*}" "$1" -Wall; }
run() { co "$1" && ./"${1%.*}" & fg; }

killport() {
    local pids
    pids=$(lsof -ti :"$1")
    [[ -n "$pids" ]] && echo "$pids" | xargs kill -9
}

chud() {
    git add .
    git commit -m "$1"
    git push
}

kittytheme() {
    cd ~/.config/kitty || return
    rm -f theme.conf
    ln -s "./kitty-themes/themes/$1.conf" theme.conf
}

bandit() {
    ssh "bandit$1@bandit.labs.overthewire.org" -p 2220
}

docxtopdf() {
    local dir="${1:-.}"
    find "$dir" -type f -name '*.docx' -print0 | while IFS= read -r -d '' f; do
        soffice --headless --convert-to pdf --outdir "$(dirname "$f")" "$f"
    done
}

pisync() {
    local project_name
    project_name=$(basename "$PWD")
    echo "Syncing $project_name to Pi..."
    rsync -avz \
        --exclude '.git' \
        --exclude 'node_modules' \
        --exclude '.next' \
        --exclude 'dist' \
        --exclude 'build' \
        --exclude '.DS_Store' \
        ./ \
        "zainpi:~/ghostwriter/code/$project_name/"
    echo "Done."
}

# ── GHOST PROTOCOL ────────────────────────────────────────────────────────────
GHOST_USER="zain"
GHOST_HOST="zainpi"
GHOST_REMOTE_BASE="~/ghostwriter/code"
GHOST_SCRIPT="~/ghostwriter/ghost.py"

ghost() {
    local project_name local_path screen_name
    if [ -z "$1" ]; then
        project_name=$(basename "$PWD")
        local_path="$PWD"
    else
        project_name="$1"
        local_path="$HOME/Developer/$project_name"
    fi
    screen_name="ghost_$project_name"

    if [ ! -d "$local_path" ]; then
        echo "Error: Could not find project at $local_path"
        return 1
    fi

    echo "Ghost Protocol: $project_name"
    ssh "$GHOST_USER@$GHOST_HOST" "mkdir -p $GHOST_REMOTE_BASE/$project_name"
    rsync -avz --quiet \
        --exclude '.git' --exclude 'node_modules' --exclude '.venv' \
        --exclude 'venv' --exclude '__pycache__' --exclude '.pytest_cache' \
        --exclude '.next' --exclude 'dist' --exclude 'build' \
        --exclude 'target' --exclude '.DS_Store' --exclude '.dart_tool' \
        "$local_path/" \
        "$GHOST_USER@$GHOST_HOST:$GHOST_REMOTE_BASE/$project_name/"
    echo "Launching: $screen_name — Ctrl+A D to detach"
    ssh -t "$GHOST_USER@$GHOST_HOST" \
        "cd $GHOST_REMOTE_BASE/$project_name && screen -S $screen_name python3 $GHOST_SCRIPT"
}

ghostview() {
    local project_name screen_name
    project_name="${1:-$(basename "$PWD")}"
    screen_name="ghost_$project_name"
    ssh -t "$GHOST_USER@$GHOST_HOST" "screen -dr $screen_name"
}

ghostlocal() {
    local target_path
    target_path="${1:+$HOME/Developer/$1}"
    target_path="${target_path:-$PWD}"

    if [ ! -d "$target_path" ]; then
        echo "Error: Project not found at $target_path"
        return 1
    fi

    echo "Local Ghost: $target_path"
    cd "$target_path" || return
    if [[ "$OSTYPE" == "darwin"* ]]; then
        caffeinate -i ~/Developer/macros/.venv/bin/python ~/Developer/macros/ghost_local.py
    else
        python3 ~/Developer/macros/ghost_local.py
    fi
}

# ── PLUGINS ───────────────────────────────────────────────────────────────────
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ── PROMPT ────────────────────────────────────────────────────────────────────
source ~/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ── COMPLETIONS ───────────────────────────────────────────────────────────────
[[ -f ~/.dart-cli-completion/zsh-config.zsh ]] && source ~/.dart-cli-completion/zsh-config.zsh

# ── IDE INTEGRATIONS ─────────────────────────────────────────────────────────
[[ "$TERM_PROGRAM" == "kiro" ]] && . "$(kiro --locate-shell-integration-path zsh)"

# ── ZOXIDE (must be last) ─────────────────────────────────────────────────────
eval "$(zoxide init zsh --cmd cd)"
