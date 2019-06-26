****Install Step*****


Add below command to .bashrc
    export vpath=~/.vim/
    export VIMINIT="source /home/stan/.vimrc"

Execute :

apt-get install cscope ctags xclip
./vim+lua.sh

Final Step:

 Modify .vimrc to add this line $rc_path='/home/ubuntu/.vimrc'

