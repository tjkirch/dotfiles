# Defined in /tmp/fish.fyQusL/dr.fish @ line 1
function dr --description 'Remove directory bookmark' --argument name
   if test -z "$name" || test -n "$argv[2]"
      echo "Usage: dr [name from ~/.bookmarks]"
      return 1
   end

   sed -i -e "/^$name /d" ~/.bookmarks
end
