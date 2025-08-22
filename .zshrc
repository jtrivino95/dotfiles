# ------------------------------------------------------------------------------
# Environment Variables
# ------------------------------------------------------------------------------
export EDITOR=vim
export NVM_DIR="$HOME/.nvm"

# ------------------------------------------------------------------------------
# Powerlevel10k Instant Prompt
#
# This should be at the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, etc.)
# must go above this block.
# ------------------------------------------------------------------------------
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ------------------------------------------------------------------------------
# Tilix VTE Configuration
# https://gnunn1.github.io/tilix-web/manual/vteconfig/
# ------------------------------------------------------------------------------
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi

# ------------------------------------------------------------------------------
# Aliases
# ------------------------------------------------------------------------------
if [ -f ~/.zsh_aliases ]; then
    . ~/.zsh_aliases
fi

# ------------------------------------------------------------------------------
# Antigen Plugin Manager
# ------------------------------------------------------------------------------
source ~/.oh-my-zsh/antigen.zsh

# Load Oh My Zsh's library.
antigen use oh-my-zsh

# Bundles
antigen bundle git
antigen bundle command-not-found
antigen bundle z
antigen bundle extract
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
#antigen bundle joshskidmore/zsh-fzf-history-search
#antigen bundle lincheney/fzf-tab-completion
antigen bundle Aloxaf/fzf-tab

# Load the theme.
#antigen theme robbyrussell
antigen theme romkatv/powerlevel10k

# Apply all the changes.
antigen apply

# ------------------------------------------------------------------------------
# Powerlevel10k Configuration
# ------------------------------------------------------------------------------
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ------------------------------------------------------------------------------
# fzf (fuzzy finder)
# ------------------------------------------------------------------------------
# Load fzf completion
#source /usr/share/doc/fzf/examples/completion.zsh
source /usr/share/doc/fzf/examples/key-bindings.zsh
#source /home/jtrivino/.antigen/bundles/lincheney/fzf-tab-completion/zsh/fzf-zsh-completion.sh
#bindkey '^I' fzf_completion

# ------------------------------------------------------------------------------
# NVM (Node Version Manager)
# ------------------------------------------------------------------------------
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
