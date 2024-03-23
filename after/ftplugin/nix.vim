" Set indentation to 2 spaces for Nix files
setlocal shiftwidth=2
setlocal softtabstop=2
setlocal expandtab

" Enable syntax highlighting
syntax enable
syntax on

" Set file type for better syntax highlighting and plugin support
setlocal filetype=nix

" Enable auto-indentation
setlocal autoindent
setlocal smartindent

" For better search experience
setlocal ignorecase
setlocal smartcase

" Highlight trailing whitespace
match ErrorMsg '\s\+$'

" Optional: Enable folding based on indentation
setlocal foldmethod=indent
setlocal foldlevelstart=99
