#!/usr/bin/env bash
# vim-tmux-navigator for herdr.
# Usage: navigate.sh left|down|up|right
# If the focused pane runs (n)vim/fzf, forward ctrl+<hjkl> to it so vim can
# move between its own splits (and call back into herdr at the edge).
# Otherwise move herdr pane focus.
dir="$1"
case "$dir" in
  left) key=ctrl+h ;; down) key=ctrl+j ;; up) key=ctrl+k ;; right) key=ctrl+l ;;
  *) exit 1 ;;
esac

herdr="${HERDR_BIN_PATH:-herdr}"
pane="${HERDR_ACTIVE_PANE_ID:-}"
[ -n "$pane" ] || pane=$("$herdr" pane current | jq -r '.result.pane.pane_id')

# Same process match as vim-tmux-navigator: view, vim, nvim, vimx, fzf...
if "$herdr" pane process-info --pane "$pane" \
  | jq -e '[.result.process_info.foreground_processes[].name]
           | any(test("^g?(view|l?n?vim?x?|fzf)(diff)?(-wrapped)?$"))' >/dev/null; then
  exec "$herdr" pane send-keys "$pane" "$key"
fi

exec "$herdr" pane focus --pane "$pane" --direction "$dir"
