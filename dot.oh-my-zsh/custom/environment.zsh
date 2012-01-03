export CFLAGS="-march=native -pipe -O2"
export CXXFLAGS="${CFLAGS}"

export GOROOT="${HOME}/code/go/go"
export GOOS="linux"
export GOHOSTOS="linux"
export GOARCH="amd64"
export GOHOSTARCH="amd64"
export GOBIN="${HOME}/local/bin"

export BROWSER="chrome"

export PATH="${HOME}/local/bin:${HOME}/.cabal/bin:${HOME}/.lein/bin:/usr/local/bin:${PATH}:/usr/sbin:/sbin"
export MANPATH="${HOME}/local/share/man:${MANPATH}"

if [[ -s /home/tjkirch/.rvm/scripts/rvm ]] ; then source /home/tjkirch/.rvm/scripts/rvm ; fi
