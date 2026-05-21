# Path to your oh-my-zsh installation.
ZSH=/usr/share/oh-my-zsh/

export DEFAULT_USER="fernando"
export TERM="xterm-256color"
export ZSH=/usr/share/oh-my-zsh

ZSH_THEME="darkblood"

autoload -Uz compinit && compinit
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # Регистронезависимое автодополнение
zstyle ':completion:*' menu select # Меню выбора
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
PROMPT='%n%m >> %F{cyan}%~%f
%F{magneta}»%f '

# Путь к файлу истории и её размер
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# Опции истории
setopt APPEND_HISTORY       # Добавлять в историю, а не перезаписывать
setopt SHARE_HISTORY        # Делиться историей между всеми вкладками
setopt HIST_IGNORE_DUPS     # Игнорировать дубликаты, идущие подряд
setopt HIST_IGNORE_SPACE    # Не записывать команды, начинающиеся с пробела

cursor=line

plugins=(git zsh-autosuggestions zsh-history-substring-search)


fastfetch
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions
source /usr/share/zsh/plugins/zsh-history-substring-search
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# Полное отключение подсветки синтаксиса
zsh-syntax-highlighting-disabled() { return 0; }
ZSH_HIGHLIGHT_HIGHLIGHTERS=()
