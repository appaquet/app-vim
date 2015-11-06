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
	set autoindent          " indent at the same level of the previous line
	set mouse=a             " automatically enable mouse usage
	set ttymouse=xterm2	    " make vim works in tmux

	if !has('gui')
		set term=$TERM      " Make arrow and other keys work
	endif

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
	map <D-s> :w<CR>
	map <Leader>s :w<CR>
	map <D-q> :q<CR>
	map <Leader>q :q<CR>




""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Key mapping

" For when you forget to sudo.. Really Write the file.	
cmap w!! w !sudo tee % >/dev/null    
cmap wq wqa
cmap qw wqq

" Allow creating a file in current buffer's directory
fun! NewCfd( arg )
  execute 'e %:p:h/' . a:arg
endfunction
command! -nargs=* E call NewCfd( '<args>' )
command! -nargs=* New call NewCfd( '<args>' )


" Delete current file. You need to close it after
"
fun! DeleteCfd( arg )
  let l:curfile = expand("%")
  silent exe ":!rm ". l:curfile
  silent exe "bwipe! " . l:curfile
endfunction
command! -nargs=* Delete call DeleteCfd( '<args>' )

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Identation preferences
""

" Defaults to spaces
setlocal expandtab shiftwidth=2 tabstop=2 cino=N-s<CR>

" Some files forced to spaces
autocmd FileType hpp setlocal expandtab shiftwidth=2 tabstop=2 cino=N-s<CR>
autocmd FileType h setlocal expandtab shiftwidth=2 tabstop=2 cino=N-s<CR>
autocmd FileType cpp setlocal expandtab shiftwidth=2 tabstop=2 cino=N-s<CR>
autocmd FileType scala setlocal expandtab shiftwidth=2 tabstop=2 cino=N-s<CR>
autocmd FileType lua setlocal expandtab shiftwidth=2 tabstop=2 cino=N-s<CR>
autocmd FileType rb setlocal expandtab shiftwidth=2 tabstop=2 cino=N-s<CR>


" Allow switching by doing <leader><tab>
nmap <leader><tab> :call SwitchTab()<CR>
function! SwitchTab()
  if (&l:expandtab)
    echo "Switched to Tabs"
    setlocal noexpandtab shiftwidth=4 tabstop=4 cino=N-s<CR>
  else
    echo "Switched to Spaces"
    setlocal expandtab shiftwidth=2 tabstop=2 cino=N-s<CR>
  endif
endfunction



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
	""     -> Show a file tree when you press ctrl-e, select current file <leader> e
	""
		Bundle 'scrooloose/nerdtree'
		map <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
		map <Leader>e :NERDTreeFind<CR>

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
	""  Ack
	""     -> Ack wrapper (find in files)
	""
		if executable('ack')
			Bundle 'mileszs/ack.vim'
			map <Leader>a :Ack <cword><CR>
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

		au FileType cpp nmap <leader>s :call SwitchSourceHeader()<CR>
		au FileType hpp nmap <leader>s :call SwitchSourceHeader()<CR>



	"" YouCompleteMe
	""     -> Detects when to trigger auto complete automatically
	""   !Warning! May clash with clang complete according to their website??
	""
		Bundle 'Valloric/YouCompleteMe'
		let g:ycm_autoclose_preview_window_after_insertion = 1 " Auto close after inserted (smarter than default vim)

	"" Go support
	""     -> Go support, see https://github.com/fatih/vim-go for help
	""
		Bundle 'fatih/vim-go'
		augroup filetypedetect
			au BufNewFile,BufRead *.go set filetype=go syntax=go
		augroup END
		au FileType go nmap <leader>r <Plug>(go-run)
		au FileType go nmap <leader>d <Plug>(go-def)
		au FileType go nmap <leader>b <Plug>(go-build)
		au FileType go nmap <leader>t <Plug>(go-test)
		au FileType go nmap <leader>i <Plug>(go-info)
		au FileType go nmap <leader>m :!make<CR>

	"" Multiple-cursors
	""    -> Ctrl-n on a word and then ctrl-n to select next, next, next and do
	""       modification on all of them). Ctrl-x to skip one, Ctrl-p to
	""       go to previous one
	""
		Bundle 'terryma/vim-multiple-cursors'

	"" Syntastic
	""    -> Multiple languages syntax checker (php, c++, scala, etc.)
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


	""
	"" Rename
	""   -> Rename current file, keeping it in same directory
	""      -> Rename[!] <newname>
	""
		Bundle 'vim-scripts/Rename2'

	""
	"" DelimitMat
	""   -> Magically closes parenthesis, brackets, etc.
	""
		Bundle 'Raimondi/delimitMate'

	""
	"" EasyMotion
	""   -> Allow to quickly move into a file with:
	""      -> <leader><leader>w to go to words
	""      -> <leader><leader>f<car> to go to a character
	""
		Bundle 'Lokaltog/vim-easymotion'



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Local overrides

	if filereadable(expand("~/.vimrc.local"))
		source ~/.vimrc.local
	endif

