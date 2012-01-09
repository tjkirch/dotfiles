function zsh_stats() {
  history | awk '{if ($2 == "sudo") print $3; else print $2}' \
  | sort | uniq -c | sort -rn | head
}

delhostkey() {
   [ "$1" -eq "$1" ] 2>/dev/null
   if [ $? -ne 0 ]; then
      echo "Usage: delhostkey <known_hosts line number>"
      return 1
   fi
   sed --in-place="-`date '+%Y%m%d%H%M%S'`" ${1}d ~/.ssh/known_hosts
}

mkcd () {
   mkdir -p $*
   cd $*
}

# make directory given by first param, move other params to it
mkmv () {
   if [ $# -lt 2 ]; then
      echo "Usage:  mkmv <dir> files..."
      exit 1
   fi

   dir=$1
   mkdir -p $dir
   shift
   mv -i $* $dir
}
