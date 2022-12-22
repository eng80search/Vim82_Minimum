" Vim compiler file
" Compiler: Microsoft MSBuild
" Maintainer:
" Last Change: 2022/06/20

" Default errorformat
CompilerSet errorformat=
  \%E%f(%l\\,%c):\ error\ %m,
  \%-G%.%#
  
" Default make
CompilerSet makeprg=MSBuild.exe\
            \ -t:Clearn,Build\
            \ -p:configuration=debug\
            \ -p:Plateform=\"x64\"\
