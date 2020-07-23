# Defined in /tmp/fish.Iq542q/agent.fish @ line 2
function agent --wraps=fixme --description 'Starts SSH agent'
   pkill -x ssh-agent
   ssh-agent > ~/.ssh/environment-$hostname
   sed -e '/echo /d' \
       -e 's/export .*//' \
       -e 's/\(.*\)=\(.*\)/set -gx \1 \2/;' \
       ~/.ssh/environment-$hostname \
       > ~/.ssh/environment-$hostname.fish
   eval (cat ~/.ssh/environment-$hostname.fish)
   ssh-add ~/.ssh/id_rsa ~/.ssh/github-ed25519
end
