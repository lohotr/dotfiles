#Author : Heapbytes <Gourav> (https://github.com/heapbytes)

PROMPT='
┌─[%F$fg_bold[blue] $(shrink_path -f)%f$reset_color] [%F{green} $(get_ip_address)%f] $(git_prompt_info)$(git_prompt_status)
%{$reset_color%}└─➜ '

RPROMPT='[%F{red}%?%f]'

get_ip_address() {
  if [[ -n "$(networksetup -getinfo Wi-Fi | grep 'Subnet mask: ')" ]]; then
    echo "%{$fg[green]%}$(ifconfig en0 | awk '/inet / {print $2}')%{$reset_color%}"
  else
    echo "%{$fg[red]%}No IP%{$reset_color%}"
  fi
}

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[cyan]%} "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_RENAMED=""

ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[yellow]%} ◒"
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg_bold[green]%} ✚"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%} ✹"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg_bold[red]%} ✖"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg_bold[blue]%} §"
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg_bold[cyan]%}⇡ "
ZSH_THEME_GIT_PROMPT_BEHIND="%{$fg_bold[cyan]%}⇣ "
