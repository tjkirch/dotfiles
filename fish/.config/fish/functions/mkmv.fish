function mkmv -d "Make a directory and move some files into it"
   if test (count $argv) -lt 2
      echo "Usage:  mkmv <dir> files..."
      return 1
   end

   mkdir -p $argv[1]
   mv -i $argv[2..-1] $argv[1]
end
