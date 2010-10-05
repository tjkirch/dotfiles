export CFLAGS="-march=native -pipe -O2"
export CXXFLAGS="${CFLAGS}"

export GOROOT="${HOME}/code/go/lang"
export GOOS="linux"
export GOARCH="amd64"
export GOBIN="${HOME}/code/go/lang/bin"

export PATH="${PATH}:${HOME}/local/bin:/usr/sbin:/sbin:${HOME}/.cabal/bin:${HOME}/.lein/bin:${HOME}/.cljr/bin"

[ -x /usr/bin/ssh-agent ] && eval `ssh-agent -s` >/dev/null

if [[ -s /home/tjkirch/.rvm/scripts/rvm ]] ; then source /home/tjkirch/.rvm/scripts/rvm ; fi
