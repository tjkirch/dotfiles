function zsh_stats() {
  history | awk '{if ($2 == "sudo") print $3; else print $2}' \
  | sort | uniq -c | sort -rn | head
}
