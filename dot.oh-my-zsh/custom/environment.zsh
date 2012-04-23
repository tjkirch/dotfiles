# Let the OS figure most of it out
source /etc/profile

export CFLAGS="-march=native -pipe -O2"
export CXXFLAGS="${CFLAGS}"

export CCACHE_DIR="${HOME}/.ccache/"

export BROWSER="firefox"

export PATH="${HOME}/local/bin:${HOME}/.cabal/bin:${HOME}/.lein/bin:${HOME}/.rvm/bin:/usr/local/bin:${PATH}:/usr/sbin:/sbin"
export MANPATH="${HOME}/local/share/man:${MANPATH}"

if [[ -s ${HOME}/.rvm/scripts/rvm ]] ; then source ${HOME}/.rvm/scripts/rvm ; fi
