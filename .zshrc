# =========== 环境变量 ===========
# homebrew 地址
export PATH="/opt/homebrew/bin:$PATH"
# 永久设置当前环境
export ENV=dev
# Added by CodeBuddy CN
export PATH="/Users/sakisdk/.codebuddy/bin:$PATH"
# Android SDK环境变量
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
export PATH=$PATH:$ANDROID_HOME/emulatorexport ANDROID_HOME=$HOME/Library/Android/sdk
export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools
export JAVA_HOME=/usr/local/opt/openjdk@8
# JAVA 环境变量
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
export PATH="$JAVA_HOME/bin:$PATH"


# =========== 代理地址 ===========
export http_proxy="http://127.0.0.1:7899"
export https_proxy="http://127.0.0.1:7899"
# export all_proxy="socks5://127.0.0.1:7890"

export ZSH="$HOME/.oh-my-zsh"
export ATUIN_SESSION=$(atuin uuid)

ZSH_THEME="robbyrussell"	

plugins=(git)

source $ZSH/oh-my-zsh.sh

bindkey -M emacs '^r' atuin-search

# ==========  meilisearch 密钥 ===========
export MEILI_MASTER_KEY="092e2fecb3a6ce1f45ca964c5d0507b97eaa1668"

# ==========  Homebrew 基础优化 ===========
# 下载失败自动重试
export HOMEBREW_CURL_RETRIES=5
# 并发下载（安全值 6~10）
export HOMEBREW_DOWNLOAD_CONCURRENCY=8
# 使用国内瓶子镜像（速度最重要）
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles
# 备选：
# export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles


# =========== 指令简化指令 ===========
# 测试终端下载速度
alias speed="speedtest --proxy=http://127.0.0.1:7899"

# neofetch快捷指令
alias mac="neofetch"

# 隐藏指定文件夹
alias hidef='chflags hidden'
# 取消隐藏
alias showf='chflags nohidden'

# 从 Spotlight 索引里移除，避免在最近使用中显示
alias rmindex='mdutil -i off'

# python快捷指令
alias pip=pip3
alias python=python3

# nvim快捷指令
alias nv=nvim

# git快捷指令
alias gadd="git add"
alias gcommit="git commit"
alias gpull="git pull"
alias gstat="git status"
alias gpush="git push"

# atuin快捷指令
alias atu="atuin"

# lsd快捷指令，替代传统的ls
alias ls="lsd"
alias lsl="lsd -l" # 详细列表
alias lsa="lsd -a" # 显示隐藏文件
alias lsla="lsd -la" # 详细显示隐藏文件
alias lsg="lsd --git" # 显示git信息
alias lslg="lsd -l --git" # 详细显示git信息
alias lslst="lsd -l --sort time" # 按时间排序
alias lslss="lsd -l --sort size" # 按大小排序
alias lslse="lsd -l --sort extension" # 按扩展名排序
alias lst="lsd --tree --depth=2" # 树状结构
alias lst1="lsd --tree --depth=1" 
alias lst3="lsd --tree --depth=3"
alias lst4="lsd --tree --depth=4"
alias lsgt="lsd --tree --git --depth=2" # 树状结构git
alias lslt="lsd -l --tree --depth=2" # 树状结构详细列表

# hyperfine快捷指令，命令性能测试
alias hf="hyperfine"

# ripgrep高效搜索快捷指令
alias rgi="rg -i" # 普通搜索忽略大小写
alias rgn="rg -n" # 搜索时显示行号
alias rgh="rg --hidden" # 搜索隐藏文件和文件夹
alias fgb="rg --binary-files=without-match" # 忽略二进制文件"

# Meilisearch快捷指令
# 前台启动
alias meilisearch-start="./meilisearch --http-addr 127.0.0.1:7700"
# 后台启动（brew services）
alias meili-start='brew services start meilisearch'
# 停止服务
alias meili-stop='brew services stop meilisearch'
# 查看服务状态
alias meili-status='brew services list | grep meilisearch'
# 健康检查
alias meili-health='curl http://127.0.0.1:7700/health'



# =========== 相关函数指令 ===========
# fzf相关函数
function fcode() {
  local base_dir="${1:-.}"
  local file

  # 确保路径存在
  [[ -d "$base_dir" ]] || {
    echo "目录不存在: $base_dir"
    return 1
  }
  file=$(fd . "$base_dir" --type f | fzf) || return
  code "$file"
}
ftrae() {
  local base_dir="${1:-.}"
  local file

  [[ -d "$base_dir" ]] || {
    echo "目录不存在: $base_dir"
    return 1
  }

  file=$(fd . "$base_dir" --type f | fzf) || return
  trae "$file"
}

# 终端开启代理
function proxy-on() {
  export http_proxy="http://127.0.0.1:7899"
  export https_proxy="http://127.0.0.1:7899"
  # export all_proxy="socks5://127.0.0.1:7890"
}
# 终端关闭代理
function proxy-off() {
  unset http_proxy
  unset https_proxy
  # unset all_proxy
}
# brew快速下载使用aria2
function brew-fast() {
  HOMEBREW_ARIA2=true \
  HOMEBREW_ARIA2_ARGS="--split=8 --min-split-size=2M --file-allocation=trunc" \
  brew "$@"
}


# =========== 预启动 ===========
# Starship
eval "$(Starship init zsh)"
# zoxide
eval "$(zoxide init zsh)"
# atuin 
eval "$(atuin init zsh)"

# Activate syntax highlighting
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# disable underline
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

# Activate autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh