" check the current os 
let os = ""
if has("win32")
  let os="win"
else
  if has("unix")
    let s:uname = system("uname")
    if s:uname == "Darwin"
      let os="mac"
    else
      let os="linux"
    endif
  endif
endif

if os=="linux"
	set mouse=
endif

set hidden
set nocompatible
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
filetype plugin indent on 
set nowrap
set number
set relativenumber
set cursorline
set background=dark
set formatoptions-=t
"set nohlsearch
set colorcolumn=80
set tabstop=2
set softtabstop=2
set shiftwidth=2
set encoding=utf-8

let mapleader = ' ' "map the leader key to <Space>

" neoclip: use <C-p> to trigger
nnoremap <C-p> :Telescope neoclip<cr>

" use U (upper) for undo
nnoremap U <C-r>

" copilot settings
"imap <silent><script><expr> <C-J> copilot#Accept("")
"let g:copilot_no_tab_map = 1

"make
nmap <F3> :w<cr>:!make -nB<cr>

" close quick fix
nmap <bslash>c <esc>:ccl<cr>

"ChatGPT
nmap <C-c>h <Esc>:ChatGPT<cr>


" vista.vim
let g:vista_default_executive = 'coc'
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista#renderer#enable_icon = 1
"nmap <leader>v :Vista!!<cr> "used by telescope coc

" continous trab shift in Visual mode
vmap < <gv
vmap > >gv

"file saving with ctrl-s
map <C-s> <esc>:wa<cr>

" file closing with ctrl-q
map <C-q> <esc>:q<cr>

" Find files using Telescope command-line sugar.
nnoremap <leader>f <cmd>Telescope find_files<cr>
nnoremap <leader>g <cmd>Telescope live_grep<cr>
nnoremap <leader>v <cmd>Telescope coc document_symbols<cr>
nnoremap <leader>t <cmd>Telescope coc workspace_symbols<cr>
"nnoremap <leader>h <cmd>Telescope help_tags<cr> "<leader>h --> toggleterm
"nnoremap <leader>p <cmd>Telescope man_pages<cr> "used by neoclip
nnoremap , <cmd>Telescope current_buffer_fuzzy_find<cr>


" nvim-tree settings
" disable netwr as suggested by nvim-tree
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1
nnoremap <leader>n :NvimTreeToggle<cr>

" line
nnoremap <leader>o o<Esc>
nnoremap <leader>O O<Esc>

nnoremap <leader>j <C-d>
vnoremap <leader>j <C-d>
nnoremap <C-j> <C-d>
vnoremap <C-j> <C-d>

nnoremap <leader>k <C-u>
vnoremap <leader>k <C-u>
nnoremap <C-k> <C-u>
vnoremap <C-k> <C-u>


" vimtex
"let g:vimtex_mappings_prefix = ','
let g:vimtex_compiler_latexmk = {
      \ 'continuous' : 0,
      \}
let g:vimtex_imaps_enabled = 0
let g:vimtex_view_method = 'skim'
let g:vimtex_view_skim_sync = 1
let g:vimtex_view_skim_activate = 1
let g:vimtex_syntax_conceal_disable = 0
"au! BufRead,BufNewFile *.tex let b:localleader = ","

" mark and jump
nmap ma mA
nmap ms mS
nmap md mD
nmap 'a 'A
nmap 's 'S
nmap 'd 'D

" define Q as q to quit editor
:command -bang Q q
:command Qa qa
:command QA qa
:command W w


"vertical windows size adjust
nmap <C-w><C-j> :vertical resize -20<cr>
nmap <C-w><C-k> :vertical resize +20<cr>
 
"terminal settings
" use Esc to escape from terminal mode
tnoremap <Esc> <C-\><C-n>
nnoremap <bslash>t :vs term://zsh<cr>


" window management
nnoremap <leader>w <C-w><C-w>

" fold
nnoremap <leader>ii zi
nnoremap <leader>m zM
 
" beginning or end of sentence
nmap - g_
vmap - g_
nmap 0 ^
vmap 0 ^

" set python3 path for nvim
if os == "mac"
	let g:python3_host_prog = '~/opt/anaconda3/bin/python3'
else
	let g:python3_host_prog = '~/anaconda3/bin/python3' 
endif


" markdown
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1

" sftp shortcuts
nmap <leader>up :UpFile<cr>
nmap <leader>uf :UpFolder<cr>
nmap <leader>dl :DlFile<cr>
nmap <leader>df :DlFolder<cr>

" vim-slime
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "{right-of}"}
let g:slime_python_ipython = 1


" indentLine
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
au FileType dashboard let b:indentLine_enabled = 0


" open ~/.vimrc file
map <bslash>v :tabe ~/.config/nvim/init.vim<CR>


" coc settings begin
set updatetime=300
set signcolumn=yes
set ic
let python_highlight_all = 1


"coc-snippet
imap <C-l> <Plug>(coc-snippets-expand)
let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-k>'
imap <C-j> <Plug>(coc-snippets-expand-jump)
"xmap <bslash>x  <Plug>(coc-convert-snippet)

"coc.nvim
"Show hover when provider exists, fallback to vim's builtin behavior.
nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
	if CocAction('hasProvider', 'hover')
		call CocActionAsync('definitionHover')
	else
		call feedkeys('K', 'in')
	endif
endfunction

"nnoremap <leader>v :CocList outline<cr> " this is done by telescope
nnoremap <leader>b :CocList buffers<cr>

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#_select_confirm()
			\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"let g:coc_snippet_next = '<tab>'

" jump
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" highlight current function
autocmd CursorHold * silent call CocActionAsync('highlight')

" rename
nmap <leader>rn <Plug>(coc-rename)
nnoremap <leader>ie :CocCommand workspace.inspectEdit<cr>
" format
map <C-f> :wa<cr>:call CocAction('format')<cr>

" code actions
nmap <leader>ac  <Plug>(coc-codeaction-cursor)

" quickfix
nmap <leader>qf  <Plug>(coc-fix-current)

" navigate among diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" coc setting  end 


" tab navigation
" go to last active tab
if !exists('g:lasttab')
  let g:lasttab = 1
endif
nmap <leader>l :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

nnoremap <leader>1 :tabn 1<cr>
nnoremap <leader>2 :tabn 2<cr>
nnoremap <leader>3 :tabn 3<cr>
nnoremap <leader>4 :tabn 4<cr>
nnoremap <leader>5 :tabn 5<cr>
nnoremap <leader>6 :tabn 6<cr>
nnoremap <leader>7 :tabn 7<cr>
nnoremap <leader>8 :tabn 8<cr>
nnoremap <leader>9 :tabn 9<cr>
nnoremap <leader>0 :tablast<cr>
nnoremap <bslash>] :tabn<CR>
nnoremap <bslash>[ :tabp<CR>


" python 设置
au Filetype python set tabstop=4
au Filetype python set softtabstop=4
au Filetype python set shiftwidth=4
au Filetype python set expandtab
au Filetype python set autoindent
au Filetype python set fileformat=unix
au Filetype python set foldmethod=indent
au Filetype python set foldlevel=99
au Filetype python map <F5> :!python3 %<CR>


" lua settings
au Filetype lua set foldmethod=indent
au Filetype lua set foldlevel=99
au Filetype lua set tabstop=2
au Filetype lua set softtabstop=2
au Filetype lua set shiftwidth=2


" C settings
au Filetype c set foldmethod=indent
au Filetype c set foldlevel=99
au Filetype c set tabstop=2
au Filetype c set softtabstop=2
au Filetype c set shiftwidth=2
au Filetype c map <F5> :w<CR>:!gcc -g -pthread % -o a.out<CR>:!./a.out<CR>
au Filetype c map <F4> :w<CR>:!gcc -g -pthread % -o a.out<CR>
au Filetype c nmap <leader>cc 0i//<Esc>


" tex settings
au Filetype tex set foldmethod=indent
au Filetype tex set foldlevel=99
au Filetype tex set tabstop=4
au Filetype tex set softtabstop=4
au Filetype tex set shiftwidth=4

" vim file settings
au Filetype c set tabstop=2
au Filetype c set softtabstop=2
au Filetype c set shiftwidth=2


"插件设置
call plug#begin('~/.vim/plugged')
	Plug 'AckslD/nvim-neoclip.lua'
	Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
	"Plug 'matze/vim-tex-fold'
	"Plug 'github/copilot.vim'
	Plug 'glepnir/dashboard-nvim'
	"Plug 'liuchengxu/vista.vim'
	Plug 'folke/trouble.nvim'
	Plug 'folke/todo-comments.nvim'
	Plug 'stevearc/dressing.nvim'
	"Plug 'echasnovski/mini.nvim', { 'branch': 'stable' }
	Plug 'ggandor/leap.nvim'
	Plug 'tpope/vim-repeat'
	Plug 'ggandor/flit.nvim'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
	Plug 'fannheyward/telescope-coc.nvim'
	Plug 'natecraddock/telescope-zf-native.nvim'
	Plug 'lukas-reineke/indent-blankline.nvim'
	Plug 'nvim-tree/nvim-tree.lua'
	"Plug 'p00f/nvim-ts-rainbow'
	Plug 'nvim-tree/nvim-web-devicons'
	Plug 'MunifTanjim/nui.nvim'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'jackMort/ChatGPT.nvim'
	"Plug 'lervag/vimtex'
	Plug 'bronson/vim-visual-star-search'
	Plug 'yuanhang/vim-sftp'
	Plug 'jpalardy/vim-slime'
	Plug 'godlygeek/tabular'
	Plug 'morhetz/gruvbox'
	Plug 'folke/tokyonight.nvim'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'nvim-treesitter/nvim-treesitter-textobjects'
	"Plug 'kien/rainbow_parentheses.vim'
	Plug 'vim-airline/vim-airline'
	"Plug 'jiangmiao/auto-pairs'
	Plug 'tpope/vim-surround'
	Plug 'tmhedberg/SimpylFold'
	Plug 'preservim/nerdcommenter'
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	Plug 'honza/vim-snippets'
	"Plug 'neoclide/coc-snippets'
	Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': 'markdown'}
call plug#end()

"set termguicolors
"colorscheme tokyonight-moon
colorscheme gruvbox

lua << EOF
require('neoclip').setup()

require("toggleterm").setup{
 open_mapping = [[<C-n>]],
 direction='float',
 insert_mappings=false
}

require('todo-comments').setup()

require('chatgpt').setup{
	openai_params = {
		max_tokens = 600,
	}, 
	chat = {
		keymaps = {
			new_session = "<C-c>n"
		},
	},
}

require("nvim-tree").setup()

require('nvim-treesitter.configs').setup {
  ensure_installed = { "c", "lua", "vim", "vimdoc" , "markdown", "yaml", "python"},
  -- I prefer 'lervag/vimtex' 
  ignore_install = { "latex" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
  auto_install = false,

  highlight = {
    enable = true,
    -- disable slow treesitter highlight for large files
    -- 'lervag/vimtex' do this better 
    disable = {"latex"},
    additional_vim_regex_highlighting = false,
  },

	rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" },
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags
  },

	textobjects = {
		select = {
      enable = true,
      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@comment.outer",
      },
      -- and should return the mode ('v', 'V', or '<c-v>')
      selection_modes = {
        ['@parameter.outer'] = 'v', -- charwise
        ['@function.outer'] = 'V', -- linewise
        ['@class.outer'] = '<c-v>', -- blockwise
      },
    },

		move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]]"] = "@function.outer",
        -- ["]]"] = { query = "@class.outer", desc = "Next class start" },
			},
			goto_previous_start = {
				["[["] = "@function.outer",
			},
		},
  },
}


vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

require("indent_blankline").setup {
	space_char_blankline = " ",
	show_current_context = true,
	show_current_context_start = true,
}

require('flit').setup {
  keys = { f = 'f', F = 'F', t = 't', T = 'T' },
  -- A string like "nv", "nvo", "o", etc.
  labeled_modes = "nvo",
  multiline = true,
  -- Like `leap`s similar argument (call-specific overrides).
  -- E.g.: opts = { equivalence_classes = {} }
  opts = {}
}

require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["<C-t>"] = "select_tab",
      }
    }
  },
}

require('telescope').load_extension("zf-native")
require('telescope').load_extension('neoclip')
require('telescope').load_extension('coc')

require('dashboard').setup{
  theme = 'hyper',
	hide = { statusline = 0, tabline = 0, },
  config = {
		header = {
			'', '', '', '', '', '',
			'██╗   ██╗██╗   ██╗ █████╗ ███╗   ██╗██╗  ██╗ █████╗ ███╗   ██╗ ██████╗ ',
			'╚██╗ ██╔╝██║   ██║██╔══██╗████╗  ██║██║  ██║██╔══██╗████╗  ██║██╔════╝ ',
			' ╚████╔╝ ██║   ██║███████║██╔██╗ ██║███████║███████║██╔██╗ ██║██║  ███╗',
			'  ╚██╔╝  ██║   ██║██╔══██║██║╚██╗██║██╔══██║██╔══██║██║╚██╗██║██║   ██║',
			'   ██║   ╚██████╔╝██║  ██║██║ ╚████║██║  ██║██║  ██║██║ ╚████║╚██████╔╝',
			'   ╚═╝    ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝ ',
		},
		shortcut = {
			{ icon = ' ', icon_hl = '@variable', desc = 'Files', group = 'Label', action = 'Telescope find_files', key = 'f', },
			{ icon = ' ', icon_hl = '@variable', desc = 'init.nvim', group = 'Label', action = 'e ~/.config/nvim/init.vim', key = 'v', }, 
			{ icon = ' ', icon_hl = '@variable', desc = 'coc-config', group = 'Label', action = ':CocConfig', key = 'c', }, },
		footer = {
			'', '---------- Keep Calm And CLear ----------',
			'', '---------- Think Before You Do ----------',
			'', '---------- Take A Break Now ----------',
		},
		packages = { enable = false },
	},
}
EOF
