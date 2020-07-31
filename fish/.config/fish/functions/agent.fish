# Defined in /tmp/fish.Wix7jT/agent.fish @ line 2
function agent --wraps=fixme --description 'Starts SSH agent'
   command agent && eval (cat ~/.ssh/environment-$hostname.fish)
end
