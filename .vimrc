set nocompatible        " be iMproved

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Misc settings
""

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
	set hidden              " Buffer switching without saving

	set autoread            " Auto reread modified file
	set smartindent
	set autoindent          " indent at the same level of the previous line
	set mouse=a             " automatically enable mouse usage
	set ttymouse=xterm2	" make vim works in tmux

	if !has('gui')
		set term=$TERM  " Make arrow and other keys work
	endif

	"" Autoclose the scratch buffer after omnicomplete selection
	autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
	autocmd InsertLeave * if pumvisible() == 0|pclose|endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Buffer shortcuts
""

	map <D-1> :br!<CR> 
	map <Leader>1 :br!<CR> 
	map <D-2> :br!<CR>:bn!<CR> 
	map <Leader>2 :br!<CR>:bn!<CR> 
	map <D-3> :br!<CR>:bn! 2<CR>
	map <Leader>3 :br!<CR>:bn! 2<CR>
	map <D-4> :br!<CR>:bn! 3<CR>
	map <Leader>4 :br!<CR>:bn! 3<CR>
	map <D-5> :br!<CR>:bn! 4<CR>
	map <Leader>5 :br!<CR>:bn! 4<CR>
	map <D-6> :br!<CR>:bn! 5<CR>
	map <Leader>6 :br!<CR>:bn! 5<CR>
	map <D-7> :br!<CR>:bn! 6<CR>
	map <Leader>7 :br!<CR>:bn! 6<CR>
	map <D-8> :br!<CR>:bn! 7<CR>
	map <Leader>8 :br!<CR>:bn! 7<CR>
	map <D-9> :br!<CR>:bn! 8<CR>
	map <Leader>9 :br!<CR>:bn! 8<CR>
	map <Leader>] :bn!<CR>
	map <Leader>[ :bp!<CR>



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Key mapping

	" For when you forget to sudo.. Really Write the file.	
	cmap w!! w !sudo tee % >/dev/null    


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" File types tab preferences
autocmd FileType make setlocal noexpandtab
autocmd FileType hpp setlocal expandtab shiftwidth=2 tabstop=2 cino=N-s
autocmd FileType h setlocal expandtab shiftwidth=2 tabstop=2 cino=N-s
autocmd FileType cpp setlocal expandtab shiftwidth=2 tabstop=2 cino=N-s
autocmd FileType scala setlocal expandtab shiftwidth=2 tabstop=2 cino=N-s
autocmd FileType rb setlocal expandtab shiftwidth=2 tabstop=2 cino=N-s


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Plugins

	""
	"" Vundle bundle manager 
	""     -> Bundle manager. To download/update bundles execute: vim +BundleInstall +qall 
	""
		set rtp+=~/.vim/bundle/vundle/
		call vundle#rc()
		Bundle 'gmarik/vundle'

	""
	"" Nerdtree
	""     -> Show a file tree when you press ctrl-e
	""
		Bundle 'scrooloose/nerdtree'
		map <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>

	""
	"" MiniBufExplorer
	""     -> Add a "tab" bar on the top to swich between buffers
	""
		let g:miniBufExplorerMoreThanOne=1
		let g:miniBufExplModSelTarget = 1
		let g:miniBufExplMapWindowNavVim = 1 
		let g:miniBufExplUseSingleClick = 1
		Bundle 'fholgado/minibufexpl.vim'

	""
	"" Powerline
	""     -> Add an awesome status line
	""
		Bundle 'Lokaltog/vim-powerline'

	""
	"" Ctrlp
	""     -> Fuzy search in file name / tags
	""
		let g:ctrlp_working_path_mode=0
		let g:ctrlp_persistent_input=0
		set wildignore+=*/.git*,*/.hg/*,*/.svn/*,*/_*,*/.DS*,*/.*swp,*/*.d,*/*.o,*/*.class,*/target/*
		Bundle 'kien/ctrlp.vim'

	""
	"" Ack
	""     -> Ack wrapper (find in files)
	""
		if executable('ack')
			Bundle 'mileszs/ack.vim'
		endif

	""
	"" Pig filetype
	""     -> Pig syntax
	""
		Bundle 'vim-scripts/pig.vim'
		augroup filetypedetect
			au BufNewFile,BufRead *.pig set filetype=pig syntax=pig
		augroup END

	"" Clang Complete
	""     -> Clang C++ completion
	""
		Bundle 'Rip-Rip/clang_complete'
		function! SwitchSourceHeader()
			if (expand ("%:e") == "cpp")
				find %:t:r.hpp
			else
				find %:t:r.cpp
			endif
		endfunction

		nmap <leader>s :call SwitchSourceHeader()<CR>

	"" Supertab 
	""    -> Bind omnicomplete to tab
	""
		Bundle 'ervandew/supertab'

	"" Multiple-cursors
	""    -> Ctrl-n on a word and then ctrl-n to select next, next, next and do
	""       modification on all of them). Ctrl-x to skip one, Ctrl-p to
	""       go to previous one
	""
		Bundle 'terryma/vim-multiple-cursors'

	"" Syntastic
	""    -> C++ syntax checker and error checker on save
	""
		Bundle 'scrooloose/syntastic'
		let g:syntastic_cpp_compiler_options = '-std=c++0x'
		let g:syntastic_cpp_check_header = 1

	""
	"" Bclose
	""     -> Close current buffer (without messing up everything like bd)
	""
		Bundle 'cespare/vim-bclose'
		map <D-0> <Plug>Kwbd
		nmap <leader>w <Plug>Kwbd

	""
	"" Jedi-vim
	""     -> Completes python
	""
		Bundle 'davidhalter/jedi-vim'

	""
	"" JSON
	""    -> JSON syntax
	""
		Bundle 'vim-scripts/JSON.vim'
		augroup filetypedetect
			au! BufRead,BufNewFile *.json set filetype=json 
		augroup END

	""
	"" Markdown
	""    -> Markdown file support (.md)
	""
		Bundle 'tpope/vim-markdown'


	""
	"" Command Caps
	""    -> Allow to take into account common shift typo like :Wq instead
	""       of :wq because shift is held for too long
	""
		Bundle 'takac/vim-commandcaps'

	""
	"" Fugitive
	""    -> Git plugin. 
	""       -> Gstatus = git status
	""       -> press - to add/reset a file
	""       -> Gcommit
	""       -> Gblame
	""       -> Ggrep
	""       -> Glog
	""
		Bundle 'tpope/vim-fugitive'

	""
	"" Solarized theme
	""     -> Nice theme, especially for macvim/gvim
	""
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

	""
	"" Vim slime
	""    -> Allow to send a line to a tmux pane/window
	""       -> Open vim in a top pane (pane #0) and open a bottom pane (11)
	""       -> Do ctrl-b q and note the destination pane id
	""       -> Use ctrl-c ctrl-c to send whole file or selected line
	""       -> First usage, select default and select :<WINDOW_ID>.<PANE ID> (ex: 5.1 for window 5, pane 1)
	""

		Bundle 'jpalardy/vim-slime'
		let g:slime_target = "tmux"

	""
	"" Scala
	""   -> Scala support
	""
		Bundle 'derekwyatt/vim-scala'
		augroup filetypedetect
			au BufNewFile,BufRead *.scala set filetype=scala syntax=scala
		augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Local overrides

	if filereadable(expand("~/.vimrc.local"))
		source ~/.vimrc.local
	endif

