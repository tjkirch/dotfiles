# Let the OS figure most of it out
source /etc/profile

export REPORTTIME=5

export CFLAGS="-march=native -pipe -O2"
export CXXFLAGS="${CFLAGS}"

export HISTSIZE=10000000
export SAVEHIST=10000000

export CCACHE_DIR="${HOME}/.ccache/"

export BROWSER="firefox"

export PAGER="less -FRX"

export PATH="${HOME}/local/bin:${HOME}/.cabal/bin:${HOME}/.lein/bin:${HOME}/.rvm/bin:/usr/local/bin:${PATH}:/usr/sbin:/sbin"
export MANPATH="${HOME}/local/share/man:${MANPATH}"

export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig/:/usr/local/share/pkgconfig"

if [[ -s ${HOME}/.rvm/scripts/rvm ]] ; then source ${HOME}/.rvm/scripts/rvm ; fi
