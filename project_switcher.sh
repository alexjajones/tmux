source ./project_roots.sh

selected=$(echo $PROJECT_ROOTS | xargs ls -d | grep -v \"^$(tmux display-message -p '#S')\$\" | fzf --reverse)
selected_name=$(echo $selected | tr "." -)

if [ "$selected_name" = "" ]; then
    echo "skipping"
else
	tmuxinator start $selected_name -n $selected_name -p ~/.config/tmux/default.yml workspace="${selected}"
fi
