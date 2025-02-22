# =^..^=   =^..^=   =^..^=   =^..^=   =^..^=   =^..^=   =^..^=   =^..^=   =^..^=
#
# System inspection
#
abbr -a duh 'du -h --max-depth=1'
abbr -a ll 'ls -ahlF --color=auto'
abbr -a pseg 'ps -ef | grep'
abbr -a ncdu 'dua i'

# =^..^=   =^..^=   =^..^=   =^..^=   =^..^=   =^..^=   =^..^=   =^..^=   =^..^=
#
# System management
#
abbr -a off 'sudo poweroff'
abbr -a reboot 'sudo reboot'
abbr -a susp 'sudo pm-suspend --auto-quirks'
abbr -a zzz 'sudo zzz'

# =^..^=   =^..^=   =^..^=   =^..^=   =^..^=   =^..^=   =^..^=   =^..^=   =^..^=
#
# Dev tools
#
abbr -a cbd 'mold --run cargo build'
abbr -a cbr 'mold --run cargo build --release'
abbr -a cm 'nice ionice -c3 cargo make'
abbr -a crd 'mold --run cargo run'
abbr -a crr 'mold --run cargo run --release'
abbr -a ct 'mold --run cargo test'

abbr -a ga 'git add'
abbr -a gap 'git add --patch'
abbr -a gb 'git branch -va'
abbr -a gc 'git commit -v'
abbr -a gco 'git checkout'
abbr -a gcp 'git cherry-pick'
abbr -a gd 'git diff'
abbr -a gdc 'git diff --cached'
abbr -a ggh 'git glog | head'
abbr -a gl 'git log'
abbr -a glp 'git log -p'
abbr -a gls 'git log --stat'
abbr -a gmf 'git merge --ff-only'
abbr -a gr 'git rebase'
abbr -a grc 'git rebase --continue'
abbr -a grh 'git reset HEAD'
abbr -a gri 'git rebase -i'
abbr -a gs 'git status'
abbr -a gsb 'git show-branch -a'

abbr -a vi nvim
abbr -a vim nvim
abbr -a view 'nvim -R'
abbr -a vimdiff 'nvim -d'

# =^..^=   =^..^=   =^..^=   =^..^=   =^..^=   =^..^=   =^..^=   =^..^=   =^..^=
#
# User tools
#
abbr -a fehz 'feh --force-aliasing -Z'
abbr -a slide 'feh -g 500x500 -drZsD3'
abbr -a slider 'feh -g 500x500 -zdrZsD3'

# =^..^=   =^..^=   =^..^=   =^..^=   =^..^=   =^..^=   =^..^=   =^..^=   =^..^=
#
# Package management
#
abbr -a ai 'sudo aptitude install'
abbr -a ais 'aptitude install -s'
abbr -a as 'aptitude search'

abbr -a ndeps-full 'nix-store --query --tree (which'
abbr -a ndeps-immediate 'nix-store --query --references (which'
abbr -a ndeps-tree "nix-store --gc --print-roots | rg -v '/proc/' | rg -Po '(?<= -> ).*' | xargs -o nix-tree"
abbr -a nfile 'nix run github:nix-community/nix-index-database'
abbr -a nfiles 'eza -lT (nix-store -q (which'
abbr -a nrevdeps 'nix-store --query --referrers (which'
abbr -a nsearch 'nix-search --details --max-results 3'
###abbr -a nshow 'nix-env -qa --description'  # need flake version
## Flake-based NixOS
# Dry-run build; see what will change
abbr -a ndry 'nice ionice -c3 nixos-rebuild dry-build'
# Update and dry-run; prepare for normal update
abbr -a nupdate-dry 'nix flake update (readlink -e /etc/nixos) && nice ionice -c3 nixos-rebuild dry-build'
# Build changes seen in dry-run, and show diff
abbr -a nbuild 'nice ionice -c3 nixos-rebuild build && nvd diff /run/current-system result && rm result'
# Build changes in debug mode after failure
abbr -a nbuild-debug 'nice ionice -c3 nixos-rebuild build --show-trace --print-build-logs --verbose'
# Switch to new config immediately
abbr -a nswitch 'sudo nice ionice -c3 nixos-rebuild switch'
# Test the new config now, but don't use it on reboot
abbr -a ntest 'sudo nice ionice -c3 nixos-rebuild test'
# Switch to new config on next boot
abbr -a nboot 'sudo nice ionice -c3 nixos-rebuild boot'
## Conventional NixOS
#abbr -a nupdate-dry 'sudo nice ionice -c3 nixos-rebuild dry-build --upgrade'
#abbr -a nupdate-build 'sudo nice ionice -c3 nixos-rebuild build --upgrade && nvd diff /run/current-system result && rm result'

abbr -a xclean 'sudo xbps-remove -O'
abbr -a xfiles 'xbps-query -f'
abbr -a xinstall 'sudo xbps-install -S'
abbr -a xlist 'xbps-query -l'
abbr -a xorphans 'sudo xbps-remove -o'
abbr -a xremove 'sudo xbps-remove -R'
abbr -a xrevdeps 'xbps-query -X'
abbr -a xrfiles 'xbps-query -R -f'
abbr -a xsearch 'xbps-query -Rs'
abbr -a xshow 'xbps-query -RS'
abbr -a xupdate 'sudo --preserve-env=LVM_SUPPRESS_FD_WARNINGS xbps-install -Su'

abbr -a yi 'sudo yum install'
abbr -a yl 'yum list'
