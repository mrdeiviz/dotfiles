#
# ~/.bash_profile
#

case ":$PATH:" in
  *":$HOME/.npm-global/bin:"*) ;;
  *) export PATH="$HOME/.npm-global/bin:$PATH" ;;
esac

[[ -f ~/.bashrc ]] && . ~/.bashrc
