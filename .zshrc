# 環境変数は ~/.zshenv

# homebrew path
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/ishikawa/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# rbenv path
eval "$(rbenv init -)"

# -------------PROMPTの設定----------------------
# 参考: https://gist.github.com/mollifier/4979906

# VCSの情報を取得するzsh関数
autoload -Uz vcs_info
autoload -Uz colors # black red green yellow blue magenta cyan white
colors

# PROMPT変数内で変数参照
setopt prompt_subst

zstyle ':vcs_info:git:*' check-for-changes true #formats 設定項目で %c,%u が使用可
zstyle ':vcs_info:git:*' stagedstr "%F{green}!" #commit されていないファイルがある
zstyle ':vcs_info:git:*' unstagedstr "%F{magenta}+" #add されていないファイルがある
zstyle ':vcs_info:*' formats "%F{cyan}%c%u(%b)%f" #通常
zstyle ':vcs_info:*' actionformats '[%b|%a]' #rebase 途中,merge コンフリクト等 formats 外の表示

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

# 単語の区切り文字を指定する
autoload -Uz select-word-style
select-word-style default
# ここで指定した文字は単語区切りとみなされる
# / も区切りと扱うので、^W でディレクトリ１つ分を削除できる
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

# %b ブランチ情報
# %a アクション名(mergeなど)
# %c changes
# %u uncommit

# プロンプト表示直前に vcs_info 呼び出し
precmd () { vcs_info }

# プロンプト（左）
PROMPT='%{$fg[yellow]%}%~%{$reset_color%}'
PROMPT=$PROMPT' ${vcs_info_msg_0_}
%{${fg[green]}%}%}$%{${reset_color}%} '

# プロンプト（右）
# RPROMPT='%{${fg[green]}%}return:[%?]%{${reset_color}%}'


########################################
# 補完

# zsh-completions(補完機能)の設定
if [ -e /usr/local/share/zsh-completions ]; then
    fpath=(/usr/local/share/zsh-completions $fpath)
fi
autoload -U compinit
compinit -u

# 補完の選択を楽にする
zstyle ':completion:*' menu select

# 補完候補をできるだけ詰めて表示する
setopt list_packed

# 補完候補にファイルの種類も表示する
#setopt list_types

# 色の設定
export LSCOLORS=Exfxcxdxbxegedabagacad

# 補完時の色設定
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

# キャッシュの利用による補完の高速化
zstyle ':completion::complete:*' use-cache true

# 補完候補に色つける
autoload -U colors ; colors ; zstyle ':completion:*' list-colors "${LS_COLORS}"
#zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# 大文字・小文字を区別しない(大文字を入力した場合は区別する)
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

########################################
# オプション
# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# '#' 以降をコメントとして扱う
setopt interactive_comments
setopt interactivecomments

# 同時に起動しているzshの間でhistoryを共有する
setopt share_history

# cd無しでもディレクトリ移動
setopt auto_cd

# コマンドのスペルミスを指摘
setopt correct

#######################################
# エイリアス

# vim
alias vi='vim'
# ls系
alias ls='ls -G'
alias la='ls -a'
alias ll='ls -lh'
# 処理確認
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
