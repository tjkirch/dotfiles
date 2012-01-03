export CFLAGS="-march=native -pipe -O2"
export CXXFLAGS="${CFLAGS}"

export GOROOT="${HOME}/code/go/go"
export GOOS="linux"
export GOHOSTOS="linux"
export GOARCH="amd64"
export GOHOSTARCH="amd64"
export GOBIN="${HOME}/local/bin"

export BROWSER="chrome"

export PATH="${PATH}:${HOME}/local/bin:/usr/sbin:/sbin:${HOME}/.cabal/bin:${HOME}/.lein/bin:${HOME}/local/opt/msp430-gcc-4.4.4/bin/"
export MANPATH="${MANPATH}:${HOME}/local/share/man"

if [[ -s /home/tjkirch/.rvm/scripts/rvm ]] ; then source /home/tjkirch/.rvm/scripts/rvm ; fi
