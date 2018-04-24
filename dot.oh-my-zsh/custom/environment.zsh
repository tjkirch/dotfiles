# Let the OS figure most of it out
source /etc/profile

export REPORTTIME=5

export CFLAGS="-march=native -pipe -O2"
export CXXFLAGS="${CFLAGS}"

export HISTSIZE=10000000
export SAVEHIST=10000000

export CCACHE_DIR="${HOME}/.ccache/"

export BROWSER="firefox"

export LESS="--tabs=4 -RX"
export PAGER="less ${LESS} -RX"

export PATH="${HOME}/local/bin:/usr/local/bin:${PATH}:/usr/sbin:/sbin"
export MANPATH="${HOME}/local/share/man:${MANPATH}"

export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig/:/usr/local/share/pkgconfig"

# For rust, and stuff in general
export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:${HOME}/local/lib"

# cabal, including shellcheck
export PATH="${PATH}:${HOME}/.cabal/bin"

# cargo-built Rust binaries
export PATH="${PATH}:${HOME}/.cargo/bin"
export RUST_SRC_PATH="${HOME}/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src"
