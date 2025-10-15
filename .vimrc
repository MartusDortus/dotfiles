execute pathogen#infect()

"       Prostredi
set wildmenu                    " Lepsi naseptavac v prikazovem modu
set wildmode=full               " Lepsi naseptavac doplnuje cokoliv
set encoding=utf8               " Internal encoding
set confirm                     " Ask to confirm instead of failure
set number                      " Cislovani radku
set showmatch                   " Zvyraznuje parove zavorky
set hlsearch                    " Zvyraznuje hledany vyraz
set incsearch                   " Zvyraznuje hledany vyraz behem jeho zadavani
set ruler                       " Poloha kurzoru (radek, znak)
set colorcolumn=80,120          " zvyrazneny sloupec
set scrolloff=5

"       Barvicky
colorscheme gruvbox
set background=dark
syntax on

"       Formatovani
set autoindent                  " automatice odsazovani
"       C
set cindent                     " odsazovani radku v blocich C

"       Uloziste ...
set undofile                    " Historie se uklada do souboru
set undodir=~/.vim/undo/        " Soubor pro historii
set directory=~/.vim/swap/      " Slozka pro .swp
set backupdir=~/.vim/backup/    " Slozka pro nejake zalohy ??

"       Znovuotevre soubor s kurzorem na pozici, kde byl zavren
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif
