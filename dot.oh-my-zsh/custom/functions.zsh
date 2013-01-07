# Allow a file to be fetched via HTTP on port 8080
function serve_file() {
   { echo -ne "HTTP/1.0 200 OK\r\n\r\n"; cat "$1"; } \
   | nc -l 8080
}

# If the host doesn't exist, nc returns immediately, but doesn't use
# a distinct return code.  Make sure it took more than 1 second.
function _safe_ncz() {
   time1="$(date '+%s')"

   nc -z ${1} ${2}
   if [ "${?}" -eq 0 ]; then
      return 0
   fi

   time2="$(date '+%s')"
   if [ "$((${time2} - ${time1}))" -le 1 ]; then
      echo "nc returned quickly, connection not available"
      return 42
   fi
}

function waitssh() {
   # Continue until ssh succeeds or there's an exception
   while true; do
      _safe_ncz ${1} 22
      rc="${?}"

      case ${rc} in
         0) echo "Success at `date`"; return;;
         42) return 42;;
      esac

      date
      sleep 30
   done
}

function zsh_stats() {
  history | awk '{if ($2 == "sudo") print $3; else print $2}' \
  | sort | uniq -c | sort -rn | head
}

function box() {
   line="${1}xxxx"
   linechar="${2:-=}"
   echo "${line//?/${linechar}}"
   echo "${linechar} ${1} ${linechar}"
   echo "${line//?/${linechar}}"
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
