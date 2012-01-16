export CFLAGS="-march=native -pipe -O2"
export CXXFLAGS="${CFLAGS}"

export CCACHE_DIR="${HOME}/.ccache/"

export GOROOT="/usr/lib/go"
export GOBIN="/usr/bin"
export GOOS="linux"
export GOARCH="amd64"

export BROWSER="firefox"

export PATH="${HOME}/local/bin:${HOME}/.cabal/bin:${HOME}/.lein/bin:/usr/local/bin:${PATH}:/usr/sbin:/sbin"
export MANPATH="${HOME}/local/share/man:${MANPATH}"

if [[ -s /home/tjkirch/.rvm/scripts/rvm ]] ; then source /home/tjkirch/.rvm/scripts/rvm ; fi
