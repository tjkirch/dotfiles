export CFLAGS="-march=native -pipe -O2"
export CXXFLAGS="${CFLAGS}"

export GOROOT="${HOME}/code/go/lang"
export GOOS="linux"
export GOARCH="amd64"
export GOBIN="${HOME}/code/go/lang/bin"

export BROWSER="firefox"

export PATH="${HOME}/local/bin:/usr/local/bin:/usr/sbin:/sbin:${HOME}/.cabal/bin:${HOME}/.lein/bin:${HOME}/local/opt/msp430-gcc-4.4.4/bin/:${PATH}"
export MANPATH="${MANPATH}:${HOME}/local/share/man"

if [[ -s /home/tjkirch/.rvm/scripts/rvm ]] ; then source /home/tjkirch/.rvm/scripts/rvm ; fi
