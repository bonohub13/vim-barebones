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

"   Cat command
"       Outputs the result of cat command in a new buffer
"       Example: Cat <name of file> <- This is the same as running
"                                      :sp term ++noclose cat <name of file>
command! -nargs=1 -complete=file Cat term ++noclose cat <q-args>
command! -nargs=1 -complete=file VCat vsplit term ++noclose cat <q-args>
command! -nargs=1 -complete=file TCat tabnew term ++noclose cat <q-args>
