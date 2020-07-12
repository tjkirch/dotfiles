# Defined in - @ line 1
function randfile --wraps=find\ .\ -type\ f\ \|\ sed\ -e\ \"s/\ /\\\\\ /g\"\ \|\ sort\ -R\ \|\ head\ -1 --description alias\ randfile=find\ .\ -type\ f\ \|\ sed\ -e\ \"s/\ /\\\\\ /g\"\ \|\ sort\ -R\ \|\ head\ -1
  find . -type f | sed -e "s/ /\\ /g" | sort -R | head -1 $argv;
end
