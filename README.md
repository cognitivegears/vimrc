# vimrc
This project keeps my .vimrc and related files.

This is based on a solarized configuration and works best if term, command
prompt etc is setup that way as well.  See http://ethanschoonover.com/solarized

Works best with the Hack font (can use other solarized fonts as well):
https://github.com/powerline/fonts/tree/master/Hack

This uses powerline, installation instructions:
Linux: http://powerline.readthedocs.io/en/master/installation/linux.html
Mac: http://powerline.readthedocs.io/en/master/installation/osx.html

Also will need a VIM compiled with python support:
vim --version|grep python


This vimrc uses tsuquyomi (https://github.com/Quramy/tsuquyomi) for typescript
support.  You'll need a pretty new version of vim (likely MacVim for the mac)
to get this to work.

Compile vimproc for a new platform using:

    pushd ~/.vim/bundle/vimproc.vim
    make
    popd





A couple of notable notes:

* <leader> is ,
* Use backslash \ for history
* Use pipe | for yankring (uber paste)
* Ctrl-Space has been heavily remapped for completion on typescript
* ,r renames a symbol, ,t shows the typescript definition, and ,u shows usages
* Ctrl-b jumps to a definition, and Ctrl-[ goes back


