" Custom commands
"   Vimrc command
"       Opens .vimrc file
command! Vimrc e ~/.vimrc

"   Make command
"       Runs Make inside of a terminal in a new buffer
"       Warning: If you close the buffer running Make, the build process is
"                killed as well
"       Example: Make build <- This is the same as running :!make build
command! -nargs=1 Make term ++noclose make <q-args>
