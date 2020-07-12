# Defined in - @ line 1
function gcp --wraps='git cherry-pick' --description 'alias gcp=git cherry-pick'
  git cherry-pick $argv;
end
