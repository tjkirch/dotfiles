# Defined in /tmp/fish.BNdvbf/agent.fish @ line 2
function agent --wraps=fixme --description 'Starts SSH agent'
   command agent
   test -s ~/.ssh/environment-$hostname.fish && eval (cat ~/.ssh/environment-$hostname.fish)
end
