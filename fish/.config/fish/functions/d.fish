# Defined in /tmp/fish.Cc05Ha/d.fish @ line 2
function d --description 'Go to directory bookmark' --argument name
   if test -z "$name" || test -n "$argv[2]"
      echo "Usage: d [name from ~/.bookmarks]"
      return 1
   end

   set -l dir (awk -v name=$name '$1==name {print $2}' ~/.bookmarks)
   if test -z "$dir"
      echo "$name is not in ~/.bookmarks" >&2
      return 1
   end

   cd $dir
end
