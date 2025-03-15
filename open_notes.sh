LOC="${NOTES_LOC:=$HOME/notes/}"

(cd $LOC && nvim -c "lua require('telescope.builtin').find_files()" .)
