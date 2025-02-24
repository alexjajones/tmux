source ~/.config/tmux/project_roots.sh

selected=$(echo $PROJECT_ROOTS | xargs ls -d | sed "s:$HOME/::" | sed 's:/*$::' | fzf --reverse)
selected_name=$(echo $selected | rev | cut -d'/' -f1 | rev)

if [ "$selected_name" = "" ]; then
    echo "skipping"
else
	tmuxinator start $selected_name -n $selected_name -p ~/.config/tmux/default.yml workspace="~/${selected}"
fi
