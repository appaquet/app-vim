set nocompatible        " be iMproved

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Misc settings

	syntax on
	filetype plugin on

	set background=dark     " Assume a dark background
	set backspace=2
	set ruler               " show the ruler
	set showmatch           " show matching brackets/parenthesis
	set incsearch           " find as you type search
	set hlsearch            " highlight search terms
	set nu                  " Line numbers on
	set smartcase           " case sensitive when uc present
	set ignorecase          " case insensitive search
	set hidden		" Buffer switching without saving

	set autoread		" Auto reread modified file
	set smartindent
	set autoindent          " indent at the same level of the previous line
	set mouse=a             " automatically enable mouse usage

	if !has('gui')
		set term=$TERM          " Make arrow and other keys work
	endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Macvim Cmd shorcuts

	map <D-1> :br!<CR> 
	map <D-2> :br!<CR>:bn!<CR> 
	map <D-3> :br!<CR>:bn!<CR>:bn!<CR>
	map <D-4> :br!<CR>:bn!<CR>:bn!<CR>:bn!<CR>
	map <D-5> :br!<CR>:bn!<CR>:bn!<CR>:bn!<CR>:bn!<CR>
	map <D-6> :br!<CR>:bn!<CR>:bn!<CR>:bn!<CR>:bn!<CR>:bn!<CR>
	map <D-7> :br!<CR>:bn!<CR>:bn!<CR>:bn!<CR>:bn!<CR>:bn!<CR>:bn!<CR>
	map <D-8> :br!<CR>:bn!<CR>:bn!<CR>:bn!<CR>:bn!<CR>:bn!<CR>:bn!<CR>:bn!<CR>
	map <D-9> :br!<CR>:bn!<CR>:bn!<CR>:bn!<CR>:bn!<CR>:bn!<CR>:bn!<CR>:bn!<CR>:bn!<CR>
	map <D-u> :!./up_sandbox.sh "%" <CR>
	map <D-/> :!php -l "%" <CR>



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Key mapping

	" For when you forget to sudo.. Really Write the file.	
	cmap w!! w !sudo tee % >/dev/null    


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Plugins

	"" Vundle bundle manager (vim +BundleInstall +qall)
		set rtp+=~/.vim/bundle/vundle/
		call vundle#rc()
		Bundle 'gmarik/vundle'

	"" Nerdtree
		Bundle 'scrooloose/nerdtree'
		map <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>

	"" MiniBufExplorer
		Bundle 'fholgado/minibufexpl.vim'
		let g:miniBufExplModSelTarget = 1
		let g:miniBufExplMapWindowNavVim = 1 
		let g:miniBufExplUseSingleClick = 1

	"" Powerline
		Bundle 'Lokaltog/vim-powerline'

	"" Ctrlp
		Bundle 'kien/ctrlp.vim'
		let g:ctrlp_working_path_mode=0
		let g:ctrlp_persistent_input=0
		set wildignore+=*/.git*,*/.hg/*,*/.svn/*,*/_*,*/.DS*,*/.*swp

	"" Git integration
		Bundle 'tpope/vim-fugitive'

	"" Ack
		if executable('ack')
			Bundle 'mileszs/ack.vim'
		endif

	"" Pig filetype
		Bundle 'vim-scripts/pig.vim'
		augroup filetypedetect
			au BufNewFile,BufRead *.pig set filetype=pig syntax=pig
		augroup END

	"" Bclose
		Bundle 'cespare/vim-bclose'
		map <D-0> <Plug>Kwbd
		nmap <leader>w! <Plug>Kwbd


	"" Solarized theme
		Bundle 'altercation/vim-colors-solarized'
		if filereadable(expand("~/.vim/bundle/vim-colors-solarized/colors/solarized.vim"))
			color solarized                 " load a colorscheme
			let g:solarized_termtrans=1
			let g:solarized_termcolors=256
			let g:solarized_contrast="high"
			let g:solarized_visibility="high"
		endif

		if has('gui_macvim')
			set transparency=5          " Make the window slightly transparent
			set guioptions-=T           " remove the toolbar
		else
			set t_Co=256		    " make sure vim uses 256 colors
		endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Local overrides

	if filereadable(expand("~/.vimrc.local"))
		source ~/.vimrc.local
	endif

