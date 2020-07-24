# Defined in /tmp/fish.JDaqRH/da.fish @ line 1
function da --description 'Add directory bookmark' --argument name
   if test -z "$name" || test -n "$argv[2]"
      echo "Usage: da [name for PWD]"
      return 1
   end

   echo "$name $PWD" >> ~/.bookmarks
end
