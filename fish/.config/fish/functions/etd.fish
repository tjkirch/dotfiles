function etd --wraps='eza -l --time-style=iso --git-ignore --tree -I target --color-scale -D' --description 'alias et=eza -l --time-style=iso --git-ignore --tree -I target --color-scale -D'
    eza -l --time-style=iso --git-ignore --tree -I target --color-scale -D $argv
end
